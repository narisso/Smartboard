class ApiController < ApplicationController

	skip_before_filter :verify_authenticity_token
	skip_before_filter :check_session

	def getProjects
		token = params[:token]
		render User.getProjectsAsJSon(token)
	end

	def login
		email = params[:email]
		password = params[:password]
		render User.loginAsJson(email,password)
	end

	def logout
		token = params[:token]
		render User.logoutAsJSon(token)
	end

	def upload
		project_id = params[:id]
		file = params[:file]
		token = params[:token]
		file_name = params[:name]
		render User.uploadAsJSon(project_id,file,token,file_name)
	end

	def getDocuments
		proj_id = params[:project_id]
		render User.getDocumentsAsJSon(proj_id)
	end
end
