class CreateDocumentTasks < ActiveRecord::Migration
  def change
    create_table :document_tasks do |t|
      t.text :description
      t.string :name
      t.integer :task_id
      t.string :url_path

      t.timestamps
    end
  end
end
