# Manages the information of the role of a user in a certain project
class ProjectRoleUsersController < ApplicationController
  # Gives the list of the roles of the users linked to a certain project as JSON
  #
  # @params id [String] the project's id
  # @return [String] the list of users with their roles as JSon
  def index
    @project = Project.find(params[:id])
    @project_role_users = ProjectRoleUser.where(:project_id => @project)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_role_users }
    end
  end

  # Gives information about a certain relation user-role
  #
  # @param id [String] the relation's id
  # @return [String] the relation's information as JSON.
  def show
    @project_role_user = ProjectRoleUser.find(params[:id])
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_role_user }
    end
  end

  # Gives the template for creating a new relation user-role-project
  #
  # @param id [String] the relation's id
  # @return [String] the information to fill about a new relation as a JSON
  def new
    @project_role_user = ProjectRoleUser.new
    @project = Project.find(params[:project_id])
    @project_role_users = ProjectRoleUser.where(:project_id => @project)

    respond_to do |format|
      format.json { render json: @project_role_user }
      format.js
    end
  end

  # Gives the template for edit a relation user-role-project
  #
  # @param id [String] the relation's id
  def edit
    @project_role_user = ProjectRoleUser.find(params[:id])
  end

  # Creates the information for a new relation project-role-user. This is, the role of a user in a certain project.
  #
  # @param project_id [String] the project's id
  # @param project_roke_user [ProjectRoleUser] the information of the new relation from POST
  # @return [String] the status of the creation, and the information of the evaluation as JSON
  def create
    if ProjectRoleUser.where(:project_id => params[:project_role_user][:project_id], :user_id => params[:project_role_user][:user_id]).exists?
      update
    else

      @project_role_user = ProjectRoleUser.new(params[:project_role_user])

      @project = Project.find(params[:project_id])
      @project_role_users = ProjectRoleUser.where(:project_id => @project)

      respond_to do |format|
        if @project_role_user.save
          format.js {redirect_to new_project_project_role_user_path, notice: 'User was successfully added.' }
          format.json { render json: @project_role_user, status: :created, location: @project_role_user }
        else
          format.js {redirect_to new_project_project_role_user_path, alert: "User already in project."}
          format.json { render json: @projects_role_user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # Changes the information of a relation project-role-user. This is, the role of a userin a certain project.
  #
  # @param project_id [String] the project's id
  # @param project_role_user [ProjectRoleUser] the information of the relation from POST
  # @return [String] the status of the update, and the information of the relation as JSON
  def update
    @project_role_user = ProjectRoleUser.where(:project_id => params[:project_role_user][:project_id], :user_id => params[:project_role_user][:user_id]).first

    respond_to do |format|
       if @project_role_user.update_attributes(params[:project_role_user])
        format.js {redirect_to new_project_project_role_user_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.js {redirect_to new_project_project_role_user_path, alert: "User already in project."}
        format.json { render json: @project_role_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes a relation project-role-user of the application
  #
  # @param id [String] the relation's id
  # @param project_id [String] the project's id
  # @return [String] the content of the deletion as JSON
  def destroy
    @project_role_user = ProjectRoleUser.find(params[:id])
    @project_role_user.destroy

    @project_role_user = ProjectRoleUser.new
    @project = Project.find(params[:project_id])
    @project_role_users = ProjectRoleUser.where(:project_id => @project)

    respond_to do |format|
      format.js { render 'new', notice: 'User removed successfully.' }
      format.json { head :no_content }
    end
  end
end