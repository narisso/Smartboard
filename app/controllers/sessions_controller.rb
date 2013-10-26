class SessionsController <  Devise::SessionsController

	skip_before_filter :check_session , :only => [:new, :create]

	def check_for_google
	  if params[:commit] == "Google Login"
	    redirect_to user_omniauth_authorize_path(:google_oauth2)
	  end
	end
end
