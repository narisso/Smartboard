#Contains the model of the template of requirements.
class RequirementTemplate < ActiveRecord::Base
  attr_accessible :name, :template_form

  has_many :requirements
end
