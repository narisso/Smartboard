class CreateDocumentUseCases < ActiveRecord::Migration
  def change
    create_table :document_use_cases do |t|
      t.text :description
      t.string :name
      t.integer :use_case_id
      t.integer :url_path

      t.timestamps
    end
  end
end
