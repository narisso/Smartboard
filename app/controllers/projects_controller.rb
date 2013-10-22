class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  load_and_authorize_resource
  skip_before_filter :check_session, only: [:hook]
  skip_authorize_resource :only => :hook

  def index   
    @projects = current_user.projects

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @linkDropbox = false
    @linkGithub = false

    if session[:dropbox_session]
      @linkDropbox = true
      @dropbox_token = session[:dropbox_session]
      session.delete :dropbox_session
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

  # GET /projects/1/edit
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

  def hook


    c = JSON.parse(params[:payload])
    commit = Commit.new
    commit.author_email = c["head_commit"]["author"]["email"]
    commit.author_name = c["head_commit"]["author"]["name"]
    commit.message = c["head_commit"]["message"]
    commit.url = c["head_commit"]["url"]
    commit.sha = c["head_commit"]["id"]
    commit.date = c["head_commit"]["timestamp"]
    sp = c["head_commit"]["message"].split "#"
    commit.task_id = sp[-1].to_i
    commit.save

    #respond 200

  end

  def create_hook
    github = Github.new :oauth_token => @project.github_token

    #Check if hook already exists

    url = URL_HOOK
    url = url.sub(":id",@project.id.to_s)


    already_exists = false

    (github.repos.hooks.list @project.github_user, @project.repo_name).body.each do |hook|
      h_url = hook["config"]["url"]
      if url == h_url
        already_exists = true
      end
    end



    if !already_exists
      github.repos.hooks.create @project.github_user, @project.repo_name,
        "name" =>  "web",
        "active" => true,
        "config" => {
          "url" => url
        }

    end
    
  end

  # POST /projects
  # POST /projects.json
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
        Status.create({name: 'Done', project_id: @project.id, order: 3})
        @project.add_user_role(current_user, Role.first)
        format.html { redirect_to boards_project_path(@project) }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
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

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  def finish
    @project = Project.find(params[:id])
    @project.project_status = ProjectStatus.where(:name => "Finished")
  end


   

end
