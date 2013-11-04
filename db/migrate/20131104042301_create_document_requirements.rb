class CreateDocumentRequirements < ActiveRecord::Migration
  def change
    create_table :document_requirements do |t|
      t.text :description
      t.string :name
      t.integer :requirement_id
      t.string :url_path

      t.timestamps
    end
  end
end
