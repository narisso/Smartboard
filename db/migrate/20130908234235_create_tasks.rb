class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :task_father_id
      t.string :type
      t.timestamp :status_update_at
      t.integer :project_id
      t.integer :status_id
      t.integer :requirement_id
      t.integer :label_id
      t.integer :estimated_hours
      t.integer :effective_hours
      t.integer :priority
      t.boolean :lock

      t.timestamps
    end
  end
end
