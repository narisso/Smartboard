class RenameColumnTypeInTask < ActiveRecord::Migration
  def up
  	rename_column :tasks, :type, :task_type
  end

  def down
  end
end
