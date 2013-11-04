class AddUseCaseIdToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :use_case_id, :integer
  end
end
