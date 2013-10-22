class BoardsController < ApplicationController
  
	
	def show
		@project = Project.find(params[:id])
		authorize! :manage, @project
		@statuses = Status.where(:project_id => params[:id]).sort_by{|e| e[:order]}
		@skip_footer = true

        respond_to do |format|
            format.html 
        end
	end

end
