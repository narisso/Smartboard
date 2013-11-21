#Contains the model of the relation between a user and a task.
class TaskUser < ActiveRecord::Base
  attr_accessible :creator_id, :developer_id, :task_id, :user_id

  belongs_to :task
  belongs_to :user
  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"
  belongs_to :developer, :class_name => "User", :foreign_key => "developer_id"
end
