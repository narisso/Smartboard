class ApiController < ApplicationController

	skip_before_filter :verify_authenticity_token
	skip_before_filter :check_session

	def getProjects
		token = params[:token]
		us = User.find_by_authentication_token(token)
		@id_user = us.id
		@proj_of_user = ProjectRoleUser.where(:user_id => @id_user)
   
		project={}
		array={}
		@proj_of_user.each do |p|
			array['user_name']=us.name
			@proj=Project.where(:id => p.project_id)
			array['project_id']=@proj.id
			array['project_name']=@proj.name
			array['project_description']=@proj.description
			array['project_finish_date']=@proj.finish_date
			array['project_status']=@proj.status
			@role=Role.where(:id => p.role_id)
			array['role_name']=@role.name


		if us
			#@pr = proj.projects.to_json(:include => :id,:name,:role)
			render :json => @proj #@pr
		else
			render :json => {:error => "Error: There's no user with given token."}
		end
	end

	def login
		email = params[:email]
		password = params[:password]

		if email.nil? or password.nil?
			render :status=>400,
			:json=>{:message=>"The request must contain the user email and password."}
			return
		end

		@user=User.find_by_email(email.downcase)

		if @user.nil?
			logger.info("User #{email} failed signin, user cannot be found.")
			render :status=>401, :json=>{:message=>"Invalid email or passoword."}
			return
		end

		# http://rdoc.info/github/plataformatec/devise/master/Devise/Models/TokenAuthenticatable
		@user.ensure_authentication_token!

		if not @user.valid_password?(password)
			logger.info("User #{email} failed signin, password \"#{password}\" is invalid")
			render :status=>401, :json=>{:message=>"Invalid email or password."}
		else
			render :status=>200, :json=>{:token=>@user.authentication_token}
		end

	end

	def logout
		@user=User.find_by_authentication_token(params[:token])
		if @user.nil?
			logger.info("Token not found.")
			render :status=>404, :json=>{:message=>"Invalid token."}
		else
			@user.reset_authentication_token!
			render :status=>200, :json=>{:token=>"Logout success."}
		end
	end
end
