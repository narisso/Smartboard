class Project < ActiveRecord::Base
  attr_accessible :description, :finish_date, :initial_date, :name, :status_id

  belongs_to :project_status

  has_many :document_projects
  has_many :use_cases
  has_many :tasks
  has_many :bugs

  has_many :roles
  has_many :users, :through => :roles

  has_many :project_role_users
  has_many :users, :through => :project_role_users
  has_many :roles, :through => :project_role_users


end
