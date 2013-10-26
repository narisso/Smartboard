class AddColumnsToDocuments < ActiveRecord::Migration
  def change
  	add_column :document_projects, :version, :integer
  	add_column :document_projects, :origin, :string
  end
end
