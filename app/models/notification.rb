class Notification < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :link, :viewed, :task, :task_id
  has_one :task
end
