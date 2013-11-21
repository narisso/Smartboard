# Manages the sessions' information
class SessionsController <  Devise::SessionsController

	skip_before_filter :check_session , :only => [:new, :create]

	# Redirects if the user logins with a Google account
	#
	# @param commit [String] The user's way of login
	def check_for_google
	  if params[:commit] == "Google Login"
	    redirect_to user_omniauth_authorize_path(:google_oauth2)
	  end
	end
end
