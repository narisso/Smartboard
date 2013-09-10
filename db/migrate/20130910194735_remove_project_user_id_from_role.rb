class RemoveProjectUserIdFromRole < ActiveRecord::Migration
  def change
  	remove_column :roles, :project_id
  	remove_column :roles, :user_id
  end
end
