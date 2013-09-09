class Project < ActiveRecord::Base
  attr_accessible :description, :finish_date, :initial_date, :name, :status

  has_many :document_projects
  has_many :use_cases
  has_many :tasks

  has_many :roles
  has_many :users, :through => :roles
end
