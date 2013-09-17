class ProjectRoleUsersController < ApplicationController
  # GET /project_role_users
  # GET /project_role_users.json
  def index
    @project = Project.find(params[:id])
    @project_role_users = ProjectRoleUser.where(:project_id => @project)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_role_users }
    end
  end

  # GET /project_role_users/1
  # GET /project_role_users/1.json
  def show
    @project_role_user = ProjectRoleUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_role_user }
    end
  end

  # GET /project_role_users/new
  # GET /project_role_users/new.json
  def new
    @project_role_user = ProjectRoleUser.new
    @project = Project.find(params[:project_id])
    @project_role_users = ProjectRoleUser.where(:project_id => @project)

    respond_to do |format|
      format.json { render json: @project_role_user }
      format.js
    end
  end

  # GET /project_role_users/1/edit
  def edit
    @project_role_user = ProjectRoleUser.find(params[:id])
  end

  # POST /project_role_users
  # POST /project_role_users.json
  def create
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

  # PUT /project_role_users/1
  # PUT /project_role_users/1.json
  def update
    @project_role_user = ProjectRoleUser.find(params[:id])

    respond_to do |format|
      if @project_role_user.update_attributes(params[:project_role_user])
        format.html { redirect_to @project_role_user, notice: 'Project role user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_role_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_role_users/1
  # DELETE /project_role_users/1.json
  def destroy
    @project_role_user = ProjectRoleUser.find(params[:id])
    @project_role_user.destroy

    @project_role_user = ProjectRoleUser.new
    @project = Project.find(params[:project_id])
    @project_role_users = ProjectRoleUser.where(:project_id => @project)

    respond_to do |format|
      format.js { render 'new', notice: 'User removed successfully.' }
      #format.js { redirect_to new_project_project_role_user_path, notice: 'User removed successfully.' }
      format.json { head :no_content }
    end
  end
end
