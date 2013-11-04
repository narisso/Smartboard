class Task < ActiveRecord::Base


  attr_accessible :description, :effective_hours, :estimated_hours, :label_id, :name, 
                  :priority, :project_id, :requirement_id, :status_id, :status_update_at, 
                  :task_father_id, :task_type, :goal_id, :task_depend_id, :assigned_users, 
                  :lock, :created_at


  belongs_to :label
  belongs_to :project
  belongs_to :requirement
  belongs_to :status
  belongs_to :task_father, :class_name => "Task", :foreign_key => "task_father_id"
  belongs_to :goal
  belongs_to :task_depend, :class_name => "Task", :foreign_key => "task_depdend_id"
  belongs_to :use_case

  has_one :bug
  has_one :evaluation
  
  has_many :comments
  has_many :reported_hours
  has_many :document_tasks
  has_many :commits
  has_many :sub_tasks

  has_many :task_users
  has_many :users, :through => :task_users

  attr_accessible :user_ids

  validates :name, :presence => true
  validates :label, :presence => true  
  validates :estimated_hours, :numericality => { :greater_than_or_equal_to => 1 }

end
