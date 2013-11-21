# Provides webservices to mobile application
class ApiController < ApplicationController

	skip_before_filter :verify_authenticity_token
	skip_before_filter :check_session

	# Gives the list of projects of a user as JSON, given a certain user token
	#
	# @param token [String] the user token
	# @return [String] the list of projects as JSON
	def getProjects
		token = params[:token]
		render User.getProjectsAsJSon(token)
	end


	# Gives the user token as JSON, given a correct set of username and password.
	#
	# @param email [String] the email of an user
	# @param password [String] the password of an user
	# @return [String] the user token as JSON
	def login
		email = params[:email]
		password = params[:password]
		render User.loginAsJson(email,password)
	end

	# Manages the logout of a user, given a certain user token
	#
	# @param token [String] the user token
	# @return [String] the result of the logout request as JSON
	def logout
		token = params[:token]
		render User.logoutAsJSon(token)
	end

	# Uploads a file to the dropbox repository of a project
	#
	# @param token [String] the user token
	# @param id [String] the project id
	# @param file [File] the file to upload
	# @param name [String] the file name
	# @return [String] the result of the upload request as JSON
	def upload
		project_id = params[:id]
		file = params[:file]
		token = params[:token]
		file_name = params[:name]
		render User.uploadAsJSon(project_id,file,token,file_name)
	end

	# Gives the list of documents of a project as JSON, given a certain project id
	#
	# @param project_id [String] the project id
	# @return [String] the list of documents as JSON
	def getDocuments
		proj_id = params[:project_id]
		render User.getDocumentsAsJSon(proj_id)
	end
end
