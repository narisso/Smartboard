class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :task_id
      t.text :description
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
