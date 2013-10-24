class AddUseCaseGroupIdToUseCase < ActiveRecord::Migration
  def change
  	add_column :use_cases, :use_case_group_id, :integer
  end
end
