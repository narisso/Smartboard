class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :url
      t.string :sha
      t.string :author_name
      t.string :author_email
      t.timestamp :date
      t.string :message
      t.integer :task_id

      t.timestamps
    end
  end
end
