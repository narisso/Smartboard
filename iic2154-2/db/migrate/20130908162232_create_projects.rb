class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.date :initial_date
      t.date :finish_date
      t.string :status

      t.timestamps
    end
  end
end
