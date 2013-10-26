class CreateUseCaseGroups < ActiveRecord::Migration
  def change
    create_table :use_case_groups do |t|
      t.string :name
      t.integer :project_id

      t.timestamps
    end
  end
end
