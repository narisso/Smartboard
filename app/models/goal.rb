# Contains the goal's model
class Goal < ActiveRecord::Base
  attr_accessible :name

  has_many :tasks
end
