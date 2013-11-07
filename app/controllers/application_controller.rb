class ApplicationController < ActionController::Base

  rescue_from CanCan::AccessDenied do |exception|
     flash[:error] = "Access denied!"
     redirect_to root_url
   end
 
  protect_from_forgery
  before_filter :check_session , :except => [:home]
  after_filter  :flash_to_headers

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

  def after_sign_in_path_for(resource)
  	projects_path
  end

  def after_sign_up_path_for(resource)
  	if resource.is_a?(User)
  		projects_path
  	end
  end

  def after_inactive_sign_up_path_for(resource)
  	 new_user_registration_path
  end

  def after_accept_path_for(resource)
      new_user_registration_path
  end

	def home 

	end 




  private
 
    def flash_to_headers
      return unless request.xhr?
      response.headers['X-Message'] = flash_message
      response.headers["X-Message-Type"] = flash_type.to_s
 
      flash.discard # don't want the flash to appear when you reload page
    end
 
    def flash_message
      [:error, :warning, :notice].each do |type|
        return flash[type] unless flash[type].blank?
      end
      # if we don't return something here, the above code will return "error, warning, notice"
      return ''
    end
 
    def flash_type
      [:error, :warning, :notice].each do |type|
        return type unless flash[type].blank?
      end
    end

end


