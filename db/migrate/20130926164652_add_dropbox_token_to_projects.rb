class AddDropboxTokenToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :dropbox_token, :string
  end
end
