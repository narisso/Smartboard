#Contains the model of the use case's of the requirment.
class RequirementUseCase < ActiveRecord::Base
  attr_accessible :requirement_id, :use_case_id, :use_case, :requirement

  belongs_to :requirement
  belongs_to :use_case

  validate :requirement,       :presence => true
  validate :use_case,       :presence => true
  validates_uniqueness_of :requirement_id, :scope => :use_case_id
end
