#Contains the model of a group of use cases.
class UseCaseGroup < ActiveRecord::Base
  attr_accessible :name, :project_id

  belongs_to :project
  has_many :use_cases
  
  validates :name, presence: true
  validates :project_id, presence: true
end
