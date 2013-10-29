class BoardsController < ApplicationController
  
	
	def show
		@project = Project.find(params[:id])
		authorize! :read, @project
		@statuses = Status.where(:project_id => params[:id]).sort_by{|e| e[:order]}
		@total = 0;

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
			    
		      	flash[:success] = ""
		end
	

        respond_to do |format|
            format.html 
        end


    #Sucede cuando soy un cliente y no estaoy autorizado, me redirecciona al board de clientes 
    rescue 
    	
    	redirect_to boards_client_project_path(@project)
	end

	def show_client

	    respond_to do |format|
	        format.html
	    end
	end 

end
