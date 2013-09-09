class CreateUseCases < ActiveRecord::Migration
  def change
    create_table :use_cases do |t|
      t.string :name
      t.text :actors
      t.text :synopsis
      t.integer :project_id

      t.timestamps
    end
  end
end
