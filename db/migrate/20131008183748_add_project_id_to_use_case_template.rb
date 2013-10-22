class AddProjectIdToUseCaseTemplate < ActiveRecord::Migration
  def change
  	add_column :use_case_templates, :project_id, :integer
  end
end
