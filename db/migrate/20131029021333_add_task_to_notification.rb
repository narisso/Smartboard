class AddTaskToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :task, :references
  end
end
