class AddLockToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :lock, :boolean, :default => false
  end
end
