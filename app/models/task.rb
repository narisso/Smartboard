class Task < ActiveRecord::Base

  attr_accessible :description, :effective_hours, :estimated_hours, :label_id, :name, :priority, :project_id, :requirement_id, :status_id, :status_update_at, :task_father_id, :task_type, :goal_id, :task_depend_id, :assigned_users

  belongs_to :label
  belongs_to :project
  belongs_to :requirement
  belongs_to :status
  belongs_to :task_father, :class_name => "Task", :foreign_key => "task_father_id"
  belongs_to :goal
  belongs_to :task_depend, :class_name => "Task", :foreign_key => "task_depdend_id"

  has_one :bug
  has_one :test
  
  has_many :comments

  has_many :document_tasks
  has_many :commits

  has_many :task_users
  has_many :users, :through => :task_users

  attr_accessible :user_ids

end
