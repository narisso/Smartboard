# Manages project's information
class ProjectsController < ApplicationController

  load_and_authorize_resource
  skip_before_filter :check_session, only: [:hook, :set_hook]
  skip_authorize_resource :only => [:hook, :set_hook, :delete_dbtoken, :unlink_github]

  respond_to :html, :json

  # Gives the list of projects of the application as JSon
  #
  # @return [String] the list of projects as JSon 
  def index   
    @projects = current_user.projects

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # Gives information about a certain project
  #
  # @param id [String] the project's id
  # @return [String] the project's information as JSON
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # Gives the template for creating a new project and, if it is possible, link it to Dropbox and Github
  #
  # @return [String] the information to fill about a new project as a JSON
  def new
    @linkDropbox = false
    @linkGithub = false
    
    if session[:dropbox_session]  
      @linkDropbox = true
      @dropbox_token = session[:dropbox_session]
      session.delete :dropbox_session 
      send_confirmation_doc  
    end 
    
    if session[:github_session]
      @linkGithub = true
      @github_token = session[:github_session]
      session.delete :github_session
      @g = Github.new :oauth_token => @github_token
      @github_username = @g.users.get.body["login"]
    end


    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # Gives the template for edit a bug, and modifies information about the link of the project with Dropbox or Github
  #
  # @param id [String] the project's id
  def edit
    @project = Project.find(params[:id])

    if session[:dropbox_session]
      @linkDropbox = true
      @dropbox_token = session[:dropbox_session]
      session.delete :dropbox_session
    elsif @project.dropbox_token
      @linkDropbox = true
      @dropbox_token = @project.dropbox_token
    end

    if session[:github_session]
      @linkGithub = true
      @github_token = session[:github_session]
      session.delete :github_session
    elsif @project.github_token
      @linkGithub = true
      @github_token = @project.github_token
    end
    
    if @github_token  
      if !@github_token.empty?
        @g = Github.new :oauth_token => @github_token
        @github_username = @g.users.get.body["login"]
      end  
    end
  end

  # Creates the hook of a commit
  #
  # @param id [String] the project's id
  # @param payload [String] the payload as JSON
  def hook
    @project = Project.find(params[:id])
    c = JSON.parse(params[:payload])

    @project.do_hook(c)

    #respond 200
  end

  # Sets the hook of a commit
  #
  # @param project_id [String] the project's id
  # @param repo_name [String] the name of the repository of Github
  def set_hook
    @project = Project.find(params[:project_id])
    @new_repo_name = params[:repo_name]

    @project.delete_hooks()

    @project.change_repo_name(,@new_repo_name)

    @project.create_hook()
    #respond_with @project
  end


  # Unlinks a Github account of a project
  #
  # @param project_id [String] the project's id
  def unlink_github
    @project = Project.find(params[:project_id])
    delete_hooks    
    @project.github_token = nil
    @project.github_user = nil
    @project.repo_name = nil
    @project.save
    redirect_to boards_project_path(@project)
  end

  # Creates the information for a new project, set it status, and set it Project Manager
  #
  # @param project [Project] the information of the new bug from POST
  # @return [String] the status of the creation, and the information of the project as JSON
  def create
    @project = Project.new(params[:project])
    @project.initial_date = Time.now
    
    respond_to do |format|
      if @project.save
        if @project.github_token? && @project.repo_name?
          create_hook
        end

        Status.create({name: 'Backlog', project_id: @project.id, order: 1 })
        Status.create({name: 'In Progress', project_id: @project.id, order: 2})
        Status.create({name: 'Done', project_id: @project.id, order: 9999})
        @project.add_user_role(current_user, Role.first)
        format.html { redirect_to boards_project_path(@project) }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # Changes the information of a project
  #
  # @param id [String] the project's id
  # @param project [Project] the information of the project from POST
  # @return [String] the status of the update, and the information of the project as JSON
  def update
    @project = Project.find(params[:id])
    #@old_repo = @project.repo_name

    respond_to do |format|
      if @project.update_attributes(params[:project])
        if @project.github_token? && @project.repo_name?
          create_hook
        end
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a project of the application and redirects the webpage
  #
  # @param id [String] the project's id
  # @return [String] the content of the deletion as JSON
  def destroy
    @project = Project.find(params[:id])
    
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  # Declares a project as Finished
  #
  # @param id [String] the project's id
  def finish
    @project = Project.find(params[:id])
    @project.project_status = ProjectStatus.where(:name => "Finished")
  end

  # Deletes the link of a project with Dropbox
  #
  # @param id [String] the project's id
  def delete_dbtoken
    @project = Project.find(params[:id])
    @project.dropbox_token=nil
    @project.save
    redirect_to boards_project_path(@project)
  end
  
  # Sends confirmation document, and read me document to a recent linked Dropbox's repository
  def send_confirmation_doc
    dbsession = DropboxSession.deserialize(@dropbox_token)
    @file_path ="SMARTBOARD/README_DROPBOX.txt"
    file = open('doc/README_DROPBOX.txt')
    client = DropboxClient.new(dbsession)
    response = client.put_file(@file_path, file)
    flash[:success] = "We have send a document to your dropbox "

    rescue 

    @dropbox_token = nil
    flash[:success] = "Failed authorized "
  end

end
