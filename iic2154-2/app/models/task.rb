class Task < ActiveRecord::Base
  attr_accessible :description, :effective_hours, :estimated_hours, :label_id, :name, :priority, :project_id, :requirement_id, :status_id, :status_update_at, :task_father_id, :type

  belongs_to :label
  belongs_to :project
  belongs_to :requirement
  belongs_to :satatus
  belongs_to :task_father, :class_name => "Task", :foreign_key => "task_father_id"
  
end
