class UseCaseTemplate < ActiveRecord::Base
  attr_accessible :name, :template_form, :project_id

  validates :name, :presence => true

  belongs_to :project

  def input_options
  	options = [['radio-button', 1], ['select', 2], ['check-box', 3], ['string', 4], ['text', 5]]
  end

  def data_types
  	options = [['string', 1], ['text', 2], ['integer', 3], ['datetime', 4], ['boolean', 5]]
  end
end
