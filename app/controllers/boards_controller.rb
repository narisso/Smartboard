class BoardsController < ApplicationController

	def show
		@projects = Project.where(:id=>params[:id])
		@statuses = Status.where(:project_id => params[:id]).sort_by{|e| e[:order]}
		@skip_footer = true
	end


end
