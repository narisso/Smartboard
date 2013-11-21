class RenameJoinTable < ActiveRecord::Migration
  def change
    rename_table :use_cases_requirements, :requirement_use_cases
  end

end
