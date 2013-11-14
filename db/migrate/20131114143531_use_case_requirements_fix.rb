class UseCaseRequirementsFix < ActiveRecord::Migration

  def change
    remove_column :requirements, :use_case_id
    remove_column :use_cases, :requirement_id

    create_table :use_cases_requirements do |t|
      t.references :use_case
      t.references :requirement
      t.timestamps
    end

  end

end
