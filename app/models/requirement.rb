class Requirement < ActiveRecord::Base
  attr_accessible :data, :name, :template_id, :type, :use_case_id, :description, :use_case_ids, 
  				  :task_ids, :document_project_ids

  belongs_to :use_case
  belongs_to :requirement_template
  belongs_to :project
  
  has_many :tasks
  has_many :use_cases
  has_many :document_requirements

  has_many :document_project_requirement
  has_many :document_projects, :through => :document_project_requirement

  validates :name, :presence => true

  def add_document doc
    if not self.document_projects.include?(doc)
      self.document_projects << doc
    end
  end

  def remove_document doc
    self.document_projects.delete(doc)
  end
end
