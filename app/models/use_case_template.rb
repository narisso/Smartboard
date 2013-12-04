#Contains the model of a template of a use case.
class UseCaseTemplate < ActiveRecord::Base
  attr_accessible :name, :template_form, :project_id

  validates :name, :presence => true

  belongs_to :project

  def input_options
  	options = [['Input Field', 'text_field_tag'], ['Radio Button', 'radio_button_tag'], ['Select', 'select_tag'], ['Check Box', 'check_box_tag'], ['Text Area', 'text_area_tag']]
  end

  def data_types
  	options = [['Text', 'string'], ['Paragraph Text', 'text'], ['Number', 'integer'], ['Date', 'datetime'], ['True/False', 'boolean']]
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
