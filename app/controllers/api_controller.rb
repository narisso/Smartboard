class ApiController < ApplicationController

	skip_before_filter :verify_authenticity_token
	skip_before_filter :check_session

	def getProjects
		token = params[:token]
		us = User.find_by_authentication_token(token)
   
		
		if us and token
			@id_user = us.id
			@proj_of_user = ProjectRoleUser.where(:user_id => @id_user)
			project_info = []
		
			@proj_of_user.each do |p|
				array = {}
				array['user_name'] = us.email
				@proj = Project.find(p.project_id)
				array['project_id'] = @proj.id
				array['project_name'] = @proj.name
				array['project_description'] = @proj.description
				array['project_finish_date'] = @proj.finish_date
				if @proj.status
					array['project_status'] = @proj.status
				else
					array['project_status']="No Status"
				end
				@role = Role.find(p.role_id)
				array['role_name'] = @role.name
				project_info << array
			end
			render :json => project_info #@pr
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


	def upload
		require 'dropbox_sdk'

		@project_id = params[:id]
		@file = params[:file]
		@user = User.find_by_authentication_token(params[:token])
		@file_name = params[:name]


				
		if @user.nil?
			logger.info("Token not found.")
			render :status=>404, :json => {:message=>"Invalid token."}
			return
		end


		if @project_id.nil? or @file.nil?
			render :json=>{:message=>"The request must contain project id and file."}
			return
		end
		@project = Project.find(@project_id)

		if @project.nil?
			render :json=>{:message=>"Project doesn't exists."}
			return
		end

		@project_of_user = ProjectRoleUser.where("user_id = ? AND project_id = ?", @user.id , @project_id )

		if @project_of_user.nil?
			render :json=>{:message=>"User doesn't have permissions."}
		else
			
			@dropbox_token = @project.dropbox_token

			if @dropbox_token.nil?
				render :json=>{:message=>"User doesn't have permissions."}
				return
			else
				file = @file.read
				@file_path ="IIC2154/" + @project.name + "/" + @file_name
				dbsession = DropboxSession.deserialize(@dropbox_token)
				client = DropboxClient.new(dbsession)
				response = client.put_file(@file_path, file)
				puts "uploaded:", response.inspect

				link = client.shares(response["path"])
				DocumentProject.create({name: @file_name, project_id: @project.id, url_path: link["url"]})

				render :json=>{:message=>response, :link=>link["url"]}
			end

		end






	end


	def getDocuments
		@document_projects = DocumentProject.where(:project_id => params[:project_id])
		if @document_projects.nil?
			render :json=>{:message=>"There's no project whit that id."}
		else
			render :json => @document_projects
		end
	end

end
