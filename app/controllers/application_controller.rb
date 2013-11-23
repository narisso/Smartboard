class ApplicationController < ActionController::Base

  rescue_from CanCan::AccessDenied do |exception|
     flash[:error] = "Access denied!"
     redirect_to root_url
   end
 
  protect_from_forgery
  before_filter :check_session , :except => [:home]
  before_filter :check_dropbox
  after_filter  :flash_to_headers

  # Handles all about the session of a user.
  #
  # @params controller [Controller] the logger information for Rails class purposes.
  def check_session
    Rails.logger.debug(params[:controller])
    unless (params[:controller] == "devise/sessions" || 
      params[:controller] == "devise_invitable/registrations" || 
      params[:controller] == "devise/invitations" ||
      params[:controller] == "devise/confirmations" ||
      params[:controller] == "devise/passwords")
      unless user_signed_in?
        Rails.logger.debug("User is not signed in")
        redirect_to root_path
        flash[:error] = "You need to sign in to access"
        return
      end
    end
    Rails.logger.debug("User is signed in")
  end

  # Handle the project path after a sign in has been made
  #
  # @param resource [Resource] the resource of the instance, i.e., the user.
  def after_sign_in_path_for(resource)
  	projects_path
  end

  # Handle the project path after a sign up has been made
  #
  # @param resource [Resource] the resource of the instance, i.e., the user.
  def after_sign_up_path_for(resource)
  	if resource.is_a?(User)
  		projects_path
  	end
  end

  # Handle the registration path after a sign up has been made
  #
  # @param resource [Resource] the resource of the instance, i.e., the user.
  def after_inactive_sign_up_path_for(resource)
  	 new_user_registration_path
  end

  # Handle the registration path after an acceptance of an user has been made
  #
  # @param resource [Resource] the resource of the instance, i.e., the user.
  def after_accept_path_for(resource)
      new_user_registration_path
  end

  # Redirects to the home's application.
	def home 
	end

  private 
    # Handles the flashes to user's notification of the application.
    def flash_to_headers
      return unless request.xhr?
      response.headers['X-Message'] = flash_message
      response.headers["X-Message-Type"] = flash_type.to_s
 
      flash.discard # don't want the flash to appear when you reload page
    end
 
    # Handles the message of the flashes to user's notification of the application.
    def flash_message
      [:error, :warning, :notice].each do |type|
        return flash[type] unless flash[type].blank?
      end
      # if we don't return something here, the above code will return "error, warning, notice"
      return ''
    end
 
    # Handles the type of a flash for user's notification of the application.
    def flash_type
      [:error, :warning, :notice].each do |type|
        return type unless flash[type].blank?
      end
    end

  def check_dropbox
      if session[:dropbox_session]  
        if params[:project_id] 
          project = Project.find(params[:project_id])
          project.dropbox_token =  session[:dropbox_session]
          project.save
          session.delete :dropbox_session 
          if send_confirmation_doc       
            flash[:success] = ""
          else
            project.dropbox_token =  nil
            project.save
            flash[:alert] = "Dropbox Auth Failed"
          end
        end
      end 
  end 

  # Puts a README file on the folder of Dropbox, when the link has just been done. 
  def send_confirmation_doc
    if params[:project_id] 
      project = Project.find(params[:project_id])
      dbsession = DropboxSession.deserialize(project.dropbox_token)
      file_path = project.name + "/" + "README_DROPBOX.txt"
      file = open('doc/README_DROPBOX.txt')
      begin
        client = DropboxClient.new(dbsession)
        response = client.put_file(file_path, file)
        flash[:success] = "We have send a document to your dropbox "
        return true
      rescue
        return false
      end
    end
  end

end


