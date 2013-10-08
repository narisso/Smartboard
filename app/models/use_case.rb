class UseCase < ActiveRecord::Base
  attr_accessible :actors, :name, :project_id, :synopsis, :use_case_template_id, :data

  belongs_to :project
  belongs_to :use_case_template
  has_many :requirements
end
