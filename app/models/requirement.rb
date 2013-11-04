class Requirement < ActiveRecord::Base
  attr_accessible :data, :name, :template_id, :type, :use_case_id, :description, :use_case_ids, :task_ids

  belongs_to :use_case
  belongs_to :requirement_template
  belongs_to :project
  
  has_many :tasks
  has_many :use_cases
  has_many :document_requirements

  validates :name, :presence => true
end
