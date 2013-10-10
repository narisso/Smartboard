class AddGithubTokenToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :github_token, :string
  end
end
