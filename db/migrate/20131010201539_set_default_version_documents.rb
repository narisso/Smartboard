class SetDefaultVersionDocuments < ActiveRecord::Migration
  def change
  	change_column_default :document_projects, :version, 0
  end
end
