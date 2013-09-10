class ProjectRoleUser < ActiveRecord::Base
  attr_accessible :project_id, :role_id, :user_id

  belongs_to :project
  belongs_to :role
  belongs_to :user
end
