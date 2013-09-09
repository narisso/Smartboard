class CreateTestCases < ActiveRecord::Migration
  def change
    create_table :test_cases do |t|
      t.text :description
      t.timestamp :executed_at
      t.boolean :approved
      t.integer :test_id

      t.timestamps
    end
  end
end
