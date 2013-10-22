class UseCaseTemplate < ActiveRecord::Base
  attr_accessible :name, :template_form, :project_id

  validates :name, :presence => true

  belongs_to :project

  def input_options
  	options = [['input', 'text_field_tag'], ['radio-button', 'radio_button_tag'], ['select', 'select_tag'], ['check-box', 'check_box_tag']]
  end

  def data_types
  	options = [['string', 1], ['text', 2], ['integer', 3], ['datetime', 4], ['boolean', 5]]
  end


end
