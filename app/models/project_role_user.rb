class ProjectRoleUser < ActiveRecord::Base
  attr_accessible :project_id, :role_id, :user_id

  belongs_to :project
  belongs_to :role
  belongs_to :user

  validate :project, 	:presence => true
  validate :role, 		:presence => true
  validate :user, 		:presence => true
  validates_uniqueness_of [:project_id, :user_id]
end
