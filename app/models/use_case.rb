class UseCase < ActiveRecord::Base
  attr_accessible :name, :project_id, :use_case_template_id, :data, :use_case_group_id, :task_ids, 
                  :document_project_ids

  belongs_to :project
  belongs_to :use_case_template
  belongs_to :use_case_group
  has_many :requirement_use_cases
  has_many :requirements, :through => :requirement_use_cases

  has_many :tasks
  has_many :document_use_cases

  has_many :document_project_use_case
  has_many :document_projects, :through => :document_project_use_case
  
  validates :name, :presence => true
  validates :project_id, :presence => true
  validates :use_case_template_id, :presence => true

  def parse_data
  	template = JSON.parse(self.use_case_template.template_form)
  	values = JSON.parse(self.data)
  	parse = Hash.new

  	template.each do |attribute|
  		parse[attribute[1]["name"]] = values[attribute[0]]
  	end
  	return parse
  end

  def add_document doc
    if not self.document_projects.include?(doc)
      self.document_projects << doc
    end
  end

  def remove_document doc
    self.document_projects.delete(doc)
  end
end
