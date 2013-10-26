class UseCaseGroup < ActiveRecord::Base
  attr_accessible :name, :project_id

  has_many :projects

  validates :name, presence: true
  validates :project_id, presence: true
end
