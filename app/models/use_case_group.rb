class UseCaseGroup < ActiveRecord::Base
  attr_accessible :name, :project_id

  has_many :use_cases
  belongs_to :project


  validates :name, presence: true
  validates :project_id, presence: true
end
