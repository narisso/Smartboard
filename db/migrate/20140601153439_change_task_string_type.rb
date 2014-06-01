class ChangeTaskStringType < ActiveRecord::Migration
  def change
    change_column :statuses, :task_order_string, :text, :default => "[]", :limit => nil
  end
end
