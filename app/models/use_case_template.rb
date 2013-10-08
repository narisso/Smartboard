class UseCaseTemplate < ActiveRecord::Base
  attr_accessible :name, :template_form

  has_many :user_case_templates
end
