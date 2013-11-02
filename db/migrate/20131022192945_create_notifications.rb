class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :link
      t.string :description
      t.references :user
      t.boolean :viewed

      t.timestamps
    end
    add_index :notifications, :user_id
  end
end
