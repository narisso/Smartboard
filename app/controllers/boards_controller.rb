class BoardsController < ApplicationController
  
	
	def show
		@project = Project.find(params[:id])
		authorize! :read, @project
		@statuses = Status.where(:project_id => params[:id]).sort_by{|e| e[:order]}
		@total = 0;

        flash[:success] = ""
        flash[:notice] = ""

		@statuses.each do |status|

			@total = @total + status.tasks.length

		end

		if (@total == 0)
			@total = 1
		end

		@skip_footer = true

		if session[:dropbox_session]

				@project.dropbox_token = session[:dropbox_session]
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

	def show_client

	    respond_to do |format|
	        format.html
	    end
	end 

	def send_confirmation_doc

      dbsession = DropboxSession.deserialize(@project.dropbox_token)
      @file_path ="SMARTBOARD/README_DROPBOX.txt"
      file = open(@file_path)
      client = DropboxClient.new(dbsession)
      response = client.put_file(@file_path, file)
      flash[:success] = "We have send a document to your dropbox "

      puts "uploaded:", response.inspect
  	rescue 

      @project.dropbox_token = nil
      @project.save
      flash[:success] = "Failed authorized"

 	end

end
