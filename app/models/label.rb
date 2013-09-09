class Label < ActiveRecord::Base
  attr_accessible :color, :name

  has_many :tasks
end
