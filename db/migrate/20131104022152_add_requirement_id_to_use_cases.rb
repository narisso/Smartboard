class AddRequirementIdToUseCases < ActiveRecord::Migration
  def change
  	add_column :use_cases, :requirement_id, :integer
  end
end
