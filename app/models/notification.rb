class Notification < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :link, :viewed, :task, :task_id
  belongs_to :task
end
