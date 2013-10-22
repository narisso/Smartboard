class ChangeDateTypeInCommitFromTimestampToString < ActiveRecord::Migration
  def up
  	change_column :commits, :date, :string
  end

  def down
  end
end
