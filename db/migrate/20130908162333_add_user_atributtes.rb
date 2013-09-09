class AddUserAtributtes < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :picture, :string
  	add_column :users, :curriculum, :string
  end
end
