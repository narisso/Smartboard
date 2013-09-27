class Status < ActiveRecord::Base
  attr_accessible :name, :project_id, :order

  has_many :tasks
  belongs_to :project
end
