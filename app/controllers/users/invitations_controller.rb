#Encoding: UTF-8
# Handles the invitations to an email account of the application
class Users::InvitationsController < Devise::InvitationsController

  skip_before_filter :check_session
  skip_authorize_resource :only => :edit

  # Creates an instance of an array of roles of a project, and fill it with the roles' project
  #
  # @param id [String] the project's id
  # @return [String] the information of the current user as JSON
  def new 
     @project = Project.find(params[:id])
     roles = Role.all  
     @roles_name = Array.new
     i = 0
     roles.each do |r|
        @roles_name[i] = r.name
        i=i+1
      end 
      self.resource = resource_class.new
      respond_to do |format|
        format.json { render json: @current_user }
        format.js
      end     
  end

  # Allowes the edition of information of an invitation token.
  #
  # @param invitation_token [String] the invitation token.
  def edit
    resource.invitation_token = params[:invitation_token]
    render :edit
  end

  # Includes the invited user in the project.
  #
  # @param project_id [String] the project's id
  # @param role_guest [String] the name of the role of the guest.
  def create
    self.resource = invite_resource
    #Once the invited user is created, it is included in the project 
    project = Project.find(params[:project_id])
    role = Role.find_by_name(params[:role_guest])
    p_role = ProjectRoleUser.new 
    p_role.project_id = project.id
    p_role.role_id = role.id
    p_role.user_id = resource.id
    p_role.save
    if resource.errors.empty?
      set_flash_message :notice, :send_instructions, :email => self.resource.email if self.resource.invitation_sent_at
      respond_with resource, :location => after_invite_path_for(resource, project)
    else
      respond_with_navigational(resource) { render :new }
    end
  end

  # Handles the actions of the path of the webpage, after an user has been invited.
  #
  # @param resource [Resource] the resource of the instance, i.e., the user.
  # @param project [Project] the project that's been handled.
  def after_invite_path_for(resource, project)
      request.referrer
  end

end