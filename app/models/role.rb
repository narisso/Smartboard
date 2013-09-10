class Role < ActiveRecord::Base
  attr_accessible :name

  belongs_to :user
  belongs_to :project

  has_many :project_role_users
  has_many :users, :through => :project_role_users
  has_many :projects, :through => :project_role_users
end
