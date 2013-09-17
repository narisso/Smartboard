class CreateProjectRoleUsers < ActiveRecord::Migration
  def change
    create_table :project_role_users do |t|
      t.integer :project_id
      t.integer :role_id
      t.integer :user_id

      t.timestamps
    end
  end
end
