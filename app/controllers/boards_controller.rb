class BoardsController < ApplicationController
  
	
	def show
		@project = Project.find(params[:id])
		authorize! :read, @project
		@statuses = Status.where(:project_id => params[:id]).sort_by{|e| e[:order]}
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
<<<<<<< HEAD
=======

    #Sucede cuando soy un cliente y no estaoy autorizado, me redirecciona al board de clientes 
    rescue 
    	
    	redirect_to boards_client_project_path(@project)

>>>>>>> mejoras_aplicacion2
	end

	def show_client

	    respond_to do |format|
	        format.html
	    end
	end 

end
