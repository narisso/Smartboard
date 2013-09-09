class Bug < ActiveRecord::Base
  attr_accessible :description, :project_id, :task_id, :test_case_id, :user_id

  belongs_to :project
  belongs_to :task
  belongs_to :user
  belongs_to :test_case
end
