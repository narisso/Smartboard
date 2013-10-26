class CreateSubTasks < ActiveRecord::Migration
  def change
    create_table :sub_tasks do |t|
      t.string :name
      t.text :description
      t.boolean :curr_state
      t.integer :task_id

      t.timestamps
    end
  end
end
