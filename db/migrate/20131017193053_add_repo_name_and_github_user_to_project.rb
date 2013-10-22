class AddRepoNameAndGithubUserToProject < ActiveRecord::Migration
  def change
 	add_column :projects, :repo_name, :string
 	add_column :projects, :github_user, :string
  end
end
