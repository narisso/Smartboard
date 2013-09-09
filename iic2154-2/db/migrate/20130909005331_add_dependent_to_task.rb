class AddDependentToTask < ActiveRecord::Migration
  def change
  	add_column :tasks, :task_depend_id, :integer
  end
end
