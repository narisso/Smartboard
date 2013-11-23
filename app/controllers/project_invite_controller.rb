class ProjectInviteController < ApplicationController

  skip_before_filter :check_session, only: [:decide, :accept, :reject]



  def invite
  	 @project = Project.find(params[:id])
     roles = Role.all  
     @roles_name = Array.new
     i = 0
     roles.each do |r|
        @roles_name[i] = r.name
        i=i+1
     end 
     respond_to do |format|
        format.json { render json: @current_user }
        format.js
     end  
      @project_role_user = ProjectRoleUser.new
  end

  def send_invitation
  	@project_role_user = ProjectRoleUser.new
  	@project = Project.find(params[:project_id])
  	@email = params[:project_invitation][:email]
  	role = Role.find_by_name(params[:role_guest])
  	@project_role_user.role_id = role.id
  	@project_role_user.project_id = @project.id
  	@project_role_user.invitation_confirmed = false

  	user = User.find_by_email(@email)

  	if user
  	  @project_role_user.user_id = user.id
  	else

  	end

    @project_role_user.save
    @project_role_user = ProjectRoleUser.find_by_project_id_and_user_id(@project.id,user.id)
    @project_role_user.update_attributes(:invitation_token => ProjectRoleUser.generate_token)
    ProjectInviteMailer.send_invitation(@project_role_user,@email).deliver

    redirect_to boards_project_path(@project)
  end

  def decide
    @project_role_user = ProjectRoleUser.find_by_invitation_token(params[:invitation_token])
    if @project_role_user
      @project = Project.find(@project_role_user.project_id)
      @invitation_token = @project_role_user.invitation_token

    else
      redirect_to root_url
    end

  end

  def accept
    @project_role_user = ProjectRoleUser.find_by_invitation_token(params[:invitation_token])
    @user = User.find(@project_role_user.user_id)
    @project_role_user.update_attributes(:invitation_confirmed => true)
    redirect_to projects_path
  end

  def reject
    @project_role_user = ProjectRoleUser.find_by_invitation_token(params[:invitation_token])
    @project_role_user.destroy
    redirect_to projects_path
  end
end
