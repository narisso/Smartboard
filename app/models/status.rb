class Status < ActiveRecord::Base
  attr_accessible :name, :project_id, :order

  has_many :tasks
end
