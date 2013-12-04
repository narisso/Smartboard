# Manages the registrations
class RegistrationsController < Devise::RegistrationsController

	skip_before_filter :check_session , :only => [:new, :create]

	#This method is an override of the devise method. It was override, 
	#because it was needed to set a password for users that didn't have one
	#because they had login with facebook or google
	#
	# @param current_password [String] the current password of the user
	def update
	    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
			prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

		if params[:user][:current_password].blank?

			if update_resource_no_password(resource, account_update_params)
		  		if is_navigational_format?
			        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
			          :update_needs_confirmation : :updated
			        set_flash_message :notice, flash_key
			    end
		      	sign_in resource_name, resource, :bypass => true
		      	respond_with resource, :location => after_update_path_for(resource)
		    else
		      	clean_up_passwords resource
		      	respond_with resource
		    end

		else

			if update_resource(resource, account_update_params)
		  		if is_navigational_format?
			        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
			          :update_needs_confirmation : :updated
			        set_flash_message :notice, flash_key
			    end
		      	sign_in resource_name, resource, :bypass => true
		      	respond_with resource, :location => after_update_path_for(resource)
		    else
		      	clean_up_passwords resource
		      	respond_with resource
		    end

		end
	end


	#This method is for update user attributes without using the current password
	#
	# @param resource [Resource] the resource of the application, i.e., the user
	# @param params [Params] the parameters to update
	def update_resource_no_password(resource, params)
		if params[:current_password].blank?
	  		params.delete("current_password")
		end    	
		resource.update_attributes(params)
	end
end