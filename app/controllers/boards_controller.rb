class BoardsController < ApplicationController


	def show
		@project = Project.find(params[:id])
		authorize! :manage, @project
		@statuses = Status.where(:project_id => params[:id]).sort_by{|e| e[:order]}
s		@skip_footer = true
	end

end
