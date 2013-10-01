class Status < ActiveRecord::Base

  attr_accessible :name, :project_id, :order
  validates :name, :project_id, :order, presence: true

  has_many :tasks
  belongs_to :project
end
