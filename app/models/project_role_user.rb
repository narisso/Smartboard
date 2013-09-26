class ProjectRoleUser < ActiveRecord::Base
  attr_accessible :project_id, :role_id, :user_id

  belongs_to :project
  belongs_to :role
  belongs_to :user

  validate :project, 	:presence => true
  validate :role, 		:presence => true
  validate :user, 		:presence => true
<<<<<<< HEAD
  #validates_uniqueness_of :project_id
=======
  validates_uniqueness_of :project_id, :scope => :user_id
>>>>>>> 34826f8cdf9a324a2e0b3ab80db2f06d5bad68aa
end
