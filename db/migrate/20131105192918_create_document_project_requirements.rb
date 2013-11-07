class CreateDocumentProjectRequirements < ActiveRecord::Migration
  def change
    create_table :document_project_requirements do |t|
      t.integer :document_project_id
      t.integer :requirement_id
    end
  end
end
