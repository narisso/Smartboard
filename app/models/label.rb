class Label < ActiveRecord::Base
  attr_accessible :color, :name, :project_id, :project

  has_many :tasks
  belongs_to :project
end
