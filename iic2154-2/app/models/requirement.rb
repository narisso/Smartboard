class Requirement < ActiveRecord::Base
  attr_accessible :data, :name, :template_id, :type, :use_case_id

  belongs_to :use_case
  belongs_to :template
  has_many :tasks
end
