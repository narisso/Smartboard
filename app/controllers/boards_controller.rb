class BoardsController < ApplicationController

	def show
		@project = Project.find(params[:id])
		@statuses = Status.where(:project_id => params[:id]).sort_by{|e| e[:order]}
		@skip_footer = true
	end

end
