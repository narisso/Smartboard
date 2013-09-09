class UseCase < ActiveRecord::Base
  attr_accessible :actors, :name, :project_id, :synopsis

  belongs_to :project
  has_many :requirements
end
