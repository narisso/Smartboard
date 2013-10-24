class RemoveColumnUseCases < ActiveRecord::Migration
  def change
  	remove_column :use_cases, :actors
	remove_column :use_cases, :synopsis
  end
end
