# Handles all about login with external accounts
class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	skip_before_filter :check_session
	
	# Asks for google's account authorization to login in SmartBoard with it.
	def google_oauth2
		user = User.from_omniauth(request.env["omniauth.auth"])
		if user.persisted?
			flash.notice = "Signed in Through Google!"
			sign_in_and_redirect user
		else
			session["devise.user_attributes"] = user.attributes
			flash.notice = "You are almost Done! Please provide a password to finish setting up your account"
			redirect_to new_user_registration_url
		end
	end

	# Asks for facebook's account authorization to login in SmartBoard with it.
	def facebook
	    # You need to implement the method below in your model (e.g. app/models/user.rb)
	    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

	    if @user.persisted?
	      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
	      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
	    else
	      session["devise.facebook_data"] = request.env["omniauth.auth"]
	      redirect_to new_user_registration_url
	    end
	end
end