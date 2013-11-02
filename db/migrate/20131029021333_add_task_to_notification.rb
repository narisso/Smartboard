class AddTaskToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :task_id, :integer
  end
end
