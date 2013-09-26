class BoardsController < ApplicationController


	def show
		@project = Project.find(params[:id])
		unauthorized! if cannot? :manage, @project
		@statuses =  @project.statuses.sort_by{|e| e[:order]}
		@skip_footer = true
	end

end
