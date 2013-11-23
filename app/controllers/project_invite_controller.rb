class ProjectInviteController < ApplicationController
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
  	@project_role_user.invitation_token = ProjectRoleUser.generate_token

  	user = User.find_by_email(@email)

  	if user
  	  @project_role_user.user_id = user.id
  	else

  	end

    ProjectInviteMailer.send_invitation(@project_role_user,@email).deliver
    @project_role_user.save
    redirect_to boards_project_path(@project)
  end

  def accept
  end

  def reject
  end
end
