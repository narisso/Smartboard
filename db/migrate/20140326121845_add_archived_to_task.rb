class AddArchivedToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :archived, :boolean , :default => false
    add_column :tasks, :user_id, :integer
  end
end
