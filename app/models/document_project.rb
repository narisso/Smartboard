class DocumentProject < ActiveRecord::Base
  attr_accessible :description, :name, :project_id, :url_path, :version, :origin

  belongs_to :project
  belongs_to :requirement
  belongs_to :use_case

  has_many :document_project_requirement
  has_many :requirements, :through => :document_project_requirement

  has_many :document_project_use_case
  has_many :use_cases, :through => :document_project_use_case

  validates_presence_of :name, :project_id, :url_path, :version, :origin

  
end
