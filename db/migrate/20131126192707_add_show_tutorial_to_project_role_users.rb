class AddShowTutorialToProjectRoleUsers < ActiveRecord::Migration
  def change
  	add_column :project_role_users, :show_tutorial, :boolean, :default => true
  end
end
