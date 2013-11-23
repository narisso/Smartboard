# Manages board's information
class BoardsController < ApplicationController
	# Shows the administrator, project manager and developer board's view and indicates the link with dropbox and github
  	#
  	# @param id [String] the project's id
  	# @param task_highlight [String]
	def show
		@project = Project.find(params[:id])
		authorize! :read, @project
		@statuses = Status.where(:project_id => params[:id]).sort_by{|e| e[:order]}
		@total = 0;		
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
    		send_confirmation_doc         
      		flash[:success] = ""
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

	# Puts a README file on the folder of Dropbox, when the link has just been done. 
	def send_confirmation_doc
      dbsession = DropboxSession.deserialize(@project.dropbox_token)
      @file_path ="README_DROPBOX.txt"
      file = open('doc/README_DROPBOX.txt')
      client = DropboxClient.new(dbsession)
      response = client.put_file(@file_path, file)
      flash[:success] = "We have send a document to your dropbox "
 	end
end
