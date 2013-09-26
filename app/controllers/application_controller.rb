class ApplicationController < ActionController::Base
  protect_from_forgery


  before_filter :check_session , :except => [:home]

  def check_session
<<<<<<< HEAD
    unless params[:controller] == "devise/sessions" || params[:controller] == "devise/registrations" || params[:controller] == "devise/confirmations"
=======
    unless (params[:controller] == "devise/sessions" || 
      params[:controller] == "devise/registrations" || 
      params[:controller] == "devise/confirmations" ||
      params[:controller] == "devise/passwords")
>>>>>>> 34826f8cdf9a324a2e0b3ab80db2f06d5bad68aa
      unless user_signed_in?
        redirect_to root_path
        flash[:error] = "You need to sign in to access"
        return
      end
    end
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


	def home 

	end 

end


