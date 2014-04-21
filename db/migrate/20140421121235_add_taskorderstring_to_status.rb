class AddTaskorderstringToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :task_order_string, :string
  end
end
