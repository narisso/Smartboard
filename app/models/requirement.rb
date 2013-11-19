class Requirement < ActiveRecord::Base
  attr_accessible :data, :name, :template_id, :type, :description, 
  				  :task_ids, :document_project_ids

  has_many :requirement_use_cases
  has_many :use_cases, :through => :requirement_use_cases
  belongs_to :requirement_template
  belongs_to :project
  
  has_many :tasks
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

  def add_remove_document(document_project,add)
    if add == "true"
      self.add_document(document_project)
      return "Document added to use case."
    else
      self.remove_document(document_project)
      return "Document removed from use case."
    end
  end
end
