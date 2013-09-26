class AddProjectToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :project_id, :integer
  end
end
