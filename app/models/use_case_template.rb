class UseCaseTemplate < ActiveRecord::Base
  attr_accessible :name, :template_form, :project_id

  validates :name, :presence => true

  belongs_to :project

  def input_options
  	options = [['radio-button', 1], ['select', 2], ['check-box', 3]]
  end

  def data_types
  	options = [['string', 1], ['text', 2], ['integer', 3], ['datetime', 4], ['boolean', 5]]
  end

  def self.create_default project
  	data = YAML::load_file(File.join(Rails.root, 'config', 'default_use_case_templates.yml'))

  	data.each do |d|
  		template = UseCaseTemplate.new
      template.project = project
  		template.name = d[1]["name"]
      template.template_form = d[1]["attributes"].to_s
      template.save
  	end
  end

end
