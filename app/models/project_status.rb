#Contains the model that contains the status of a project.
class ProjectStatus < ActiveRecord::Base
  attr_accessible :name

  has_many :projects
end
