class ProjectInviteController < ApplicationController

  skip_before_filter :verify_authenticity_token
  skip_before_filter :check_session, only: [:decide, :accept, :reject, :confirm_password_invitation,:submit_password_invitation]



  def invite
  	 @project = Project.find(params[:id])
     @project_role_users = ProjectRoleUser.where(:project_id => @project, :invitation_confirmed => false)
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
    flash[:notice] = "An invitation email has been sent to #{@email}."

  	if not user
      user = User.new(:email=> @email, :password => 'asdfasdf', :password_confirmation => 'asdfasdf')
      user.encrypted_password=""
      user.skip_confirmation!
      user.save
  	end
    
    @project_role_user.user_id = user.id
    @project_role_user.save
    @project_role_user = ProjectRoleUser.find_by_project_id_and_user_id(@project.id,user.id)
    @project_role_user.update_attributes(:invitation_token => ProjectRoleUser.generate_token)
    ProjectInviteMailer.send_invitation(@project_role_user,@email).deliver

    redirect_to boards_project_path(@project)
  end

  def decide
    @project_role_user = ProjectRoleUser.find_by_invitation_token(params[:invitation_token])
    if @project_role_user
      @project_invited = Project.find(@project_role_user.project_id)
      @invitation_token = @project_role_user.invitation_token
      user = User.find(@project_role_user.user_id)
      if user.encrypted_password == ""
        redirect_to confirm_password_invitation_path(:invitation_token=>@invitation_token)
      end

    else
      redirect_to root_url
    end

  end

  def confirm_password_invitation
    @project_role_user = ProjectRoleUser.find_by_invitation_token(params[:invitation_token])
    #@project = Project.find(@project_role_user.project_id)
    @invitation_token = @project_role_user.invitation_token
    @user = User.find(@project_role_user.user_id)

  end

  def submit_password_invitation
    @project_role_user = ProjectRoleUser.find_by_invitation_token(params[:invitation_token])
    @user = User.find(@project_role_user.user_id)
    if @user.update_attributes(params[:password_set])
      @user.confirm!
      redirect_to decide_invitation_project_path(:invitation_token => params[:invitation_token])
    else
      if params[:password_set][:password]!=params[:password_set][:password_confirmation]
        flash[:error] = 'Password and password confirmation must be the same'
      elsif params[:password_set][:password].length<8
        flash[:error] = 'Password must be at least 8 characters long'
      else
        flash[:error] = 'Password invalid'
      end
      redirect_to :back
    end
  end

  def accept
    @project_role_user = ProjectRoleUser.find_by_invitation_token(params[:invitation_token])
    if @project_role_user
      @user = User.find(@project_role_user.user_id)
      @project_role_user.update_attributes(:invitation_confirmed => true)
      @project_accepted = Project.find(@project_role_user.project_id)
      sign_in @user
    end
    redirect_to boards_project_path(@project_role_user.project)
  end

  def reject
    @project_role_user = ProjectRoleUser.find_by_invitation_token(params[:invitation_token])
    if @project_role_user
      @project_role_user.destroy
      @project_accepted = Project.find(@project_role_user.project_id)
      flash[:notice] = "You rejected the invitation to Project #{@project_accepted.name}"
    end
    redirect_to root_url
  end
end
