class AddDescriptionToRequirement < ActiveRecord::Migration
  def change
  	add_column :requirements, :description, :text
  	add_column :requirements, :project_id, :integer
  end
end
