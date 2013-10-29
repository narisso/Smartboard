class UseCaseTemplate < ActiveRecord::Base
  attr_accessible :name, :template_form, :project_id

  validates :name, :presence => true

  belongs_to :project

  def input_options
  	options = [['input', 'text_field_tag'], ['radio-button', 'radio_button_tag'], ['select', 'select_tag'], ['check-box', 'check_box_tag'], ['text_area', 'text_area_tag']]
  end

  def data_types
  	options = [['string', 'string'], ['text', 'text'], ['integer', 'integer'], ['datetime', 'datetime'], ['boolean', 'boolean']]
  end

  def self.create_default project
  	data = YAML::load_file(File.join(Rails.root, 'config', 'default_use_case_templates.yml'))

  	data.each do |d|
  		template = UseCaseTemplate.new
      template.project = project
  		template.name = d[1]["name"]
      template.template_form = d[1]["attributes"].to_json
      template.save
  	end
  end

end
