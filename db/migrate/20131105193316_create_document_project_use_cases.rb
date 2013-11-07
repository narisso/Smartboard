class CreateDocumentProjectUseCases < ActiveRecord::Migration
  def change
    create_table :document_project_use_cases do |t|
      t.integer :document_project_id
      t.integer :use_case_id

      t.timestamps
    end
  end
end
