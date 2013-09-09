class CreateTaskUsers < ActiveRecord::Migration
  def change
    create_table :task_users do |t|
      t.integer :task_id
      t.integer :user_id
      t.integer :developer_id
      t.integer :creator_id

      t.timestamps
    end
  end
end
