class RenameModelTestToEvaluation < ActiveRecord::Migration
  def up
  	rename_table :tests, :evaluations
  	rename_column :test_cases, :test_id, :evaluation_id
  end

  def down
  end
end
