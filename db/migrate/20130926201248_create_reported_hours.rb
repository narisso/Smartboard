class CreateReportedHours < ActiveRecord::Migration
  def change
    create_table :reported_hours do |t|
      t.integer :user_id
      t.integer :task_id
      t.integer :reporting_hours

      t.timestamps
    end
  end
end
