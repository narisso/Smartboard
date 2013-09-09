class CreateDocumentProjects < ActiveRecord::Migration
  def change
    create_table :document_projects do |t|
      t.string :name
      t.text :description
      t.string :url_path
      t.integer :project_id

      t.timestamps
    end
  end
end
