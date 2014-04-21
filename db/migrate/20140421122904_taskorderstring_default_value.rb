class TaskorderstringDefaultValue < ActiveRecord::Migration
    def up
        change_column :statuses, :task_order_string, :string, :default => "[]"
    end

    def down
        change_column :statuses, :task_order_string, :string, :default => nil
    end
end
