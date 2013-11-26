# Manages board's information
class BoardsController < ApplicationController
  require 'dropbox_sdk'
	# Shows the administrator, project manager and developer board's view and indicates the link with dropbox and github
  	#
  	# @param id [String] the project's id
  	# @param task_highlight [String]
	def show
		@project = Project.find(params[:id])
		authorize! :read, @project
		@statuses = Status.where(:project_id => params[:id]).sort_by{|e| e[:order]}
		@total = 0;		
		@tutorial = ProjectRoleUser.find_by_user_id_and_project_id(current_user.id, @project.id)
		@tutorial.save
		
		begin
			if @project.github_token
				g=Github.new :oauth_token => @project.github_token
				g.repos.list
			end
		rescue Github::Error::GithubError => e
			@project.github_token = nil
			@project.github_user = nil
			@project.repo_name = nil
			@project.save           
		end
		flash[:success] = ""
    	@statuses.each do |status|
      		@total = @total + status.tasks.length
    	end
    	if (@total == 0)
      		@total = 1
    	end
    	skip_footer = true
 		if session[:dropbox_session]  
          	@project.dropbox_token =  session[:dropbox_session]
          	@project.save
          	session.delete :dropbox_session 
          if send_confirmation_doc       
          	flash[:success] = ""
          else
            @project.dropbox_token =  nil
            @project.save
          end
        end  	
		@highlight = params[:task_highlight]
        respond_to do |format|
            format.html 
        end
	end

	# Shows the client board's view
	def show_client
	    respond_to do |format|
	        format.html
	    end
	end 

	# Stop showing tutorial for a project
	def accept_tutorial
		@project = Project.find(params[:id])
		@tutorial = ProjectRoleUser.find_by_user_id_and_project_id(current_user.id, @project.id)
		@tutorial.show_tutorial = false
		@tutorial.save
		respond_to do |format|
	        format.js {head :ok}
	    end
	end

	# Request html for tutorial
	def show_tutorial
		@project  = Project.find(params[:id])
		@tutorial = ProjectRoleUser.find_by_user_id_and_project_id(current_user.id, @project.id)

		respond_to do |format|
			if @tutorial.show_tutorial and @tutorial.role_id == 1
	        	format.js { render partial: "tutorial" }
	        else
	        	format.js { head :no_content }
	        end
	    end
	end

	# Puts a README file on the folder of Dropbox, when the link has just been done. 
  	def send_confirmation_doc
      dbsession = DropboxSession.deserialize(@project.dropbox_token)
      file_path =@project.name + "/" + "README_DROPBOX.txt"
      file = open('doc/README_DROPBOX.txt')
      begin
        client = DropboxClient.new(dbsession)
        response = client.put_file(file_path, file)
        flash[:success] = "We have send a document to your dropbox "
        return true
      rescue
        return false
      end
  	end



end
