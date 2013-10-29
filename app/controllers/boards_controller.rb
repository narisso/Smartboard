class BoardsController < ApplicationController


	def show
		@project = Project.find(params[:id])
		authorize! :manage, @project
		@statuses = Status.where(:project_id => params[:id]).sort_by{|e| e[:order]}
		@total = 0;

		@statuses.each do |status|

			@total = @total + status.tasks.length

		end

		if (@total == 0)
			@total = 1
		end

		@skip_footer = true

        respond_to do |format|
            format.html 
        end

	end

end
