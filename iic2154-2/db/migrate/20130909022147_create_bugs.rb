class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.text :description
      t.integer :user_id
      t.integer :project_id
      t.integer :test_case_id
      t.integer :task_id

      t.timestamps
    end
  end
end
