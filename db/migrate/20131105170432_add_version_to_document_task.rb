class AddVersionToDocumentTask < ActiveRecord::Migration
  def change
  	add_column :document_tasks, :version, :integer
  	add_column :document_tasks, :original_name, :string
  end
end
