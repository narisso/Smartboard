class Evaluation < ActiveRecord::Base
  attr_accessible :code, :description, :name, :task_id

  belongs_to :task
  has_many :test_cases
end
