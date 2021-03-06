#Contains the model of the relation of the role of a user in a project
class ProjectRoleUser < ActiveRecord::Base
  attr_accessible :project_id, :role_id, :user_id, :invitation_token, :invitation_confirmed, :show_tutorial

  belongs_to :project
  belongs_to :role
  belongs_to :user

  validate :project, 	:presence => true
  validate :role, 		:presence => true
  validate :user, 		:presence => true
  validates_uniqueness_of :project_id, :scope => :user_id

  def self.generate_token
    random_token = SecureRandom.urlsafe_base64(nil, false)
  end
end
