class Users::InvitationsController < Devise::InvitationsController

  skip_before_filter :check_session
  skip_authorize_resource :only => :edit

  def new 
     @project = Project.find(params[:id])
   

     self.resource = resource_class.new
     render :new
     
  end

  def edit
    resource.invitation_token = params[:invitation_token]
    render :edit
  end


   def create

    self.resource = invite_resource

    #Una vez que se ha creado el usuario que fue invitado, lo incluimos en el proyecto 
    project = Project.find(params[:project_id])
    role = Role.find_by_name("Developer")

    p_role = ProjectRoleUser.new 

    p_role.project_id = project.id
    p_role.role_id = role.id
    p_role.user_id = resource.id

    p_role.save

    if resource.errors.empty?
      set_flash_message :notice, :send_instructions, :email => self.resource.email if self.resource.invitation_sent_at
      respond_with resource, :location => after_invite_path_for(resource)
    else
      respond_with_navigational(resource) { render :new }
    end
  end

 


end