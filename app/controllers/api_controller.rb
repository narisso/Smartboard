class ApiController < ApplicationController
	def getProyects
		token = params[:token]
		us = User.find_by_token(token)
		@id_user = us.id
		@proj = ProjectRoleUser.where(:user_id => @id_user)
		if us
			#@pr = proj.projects.to_json(:include => :id,:name,:role)
			render :json => @proj #@pr
		else
			render :json => {:error => "Error: There's no user with given token."}
		end
	end
end
