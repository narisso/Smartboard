#Contains the task's model
class Task < ActiveRecord::Base

  attr_accessible :description, :effective_hours, :estimated_hours, :label_id, :name, 
                  :priority, :project_id, :requirement_id, :status_id, :status_update_at, 
                  :task_father_id, :task_type, :goal_id, :task_depend_id, :assigned_users, 
                  :lock, :created_at, :use_case_id, :archived, :user_id

  belongs_to :label
  belongs_to :project
  belongs_to :requirement
  belongs_to :status
  belongs_to :task_father, :class_name => "Task", :foreign_key => "task_father_id"
  belongs_to :goal
  belongs_to :task_depend, :class_name => "Task", :foreign_key => "task_depdend_id"
  belongs_to :use_case
  belongs_to :user

  has_one :bug
  has_one :evaluation
  has_many :notifications
  
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

  # Gives all the documents of a certain task, including the use case's ones.
  def use_case_documents
    documents = []
    if not self.requirement.nil?
      self.requirement.use_cases.each do |use_case|
        documents.concat use_case.document_projects
      end
    end
    if not self.use_case.nil?
      documents.concat self.use_case.document_projects
    end

    return documents.uniq
  end

  # Saves the changes of the task and creates a notification to the user assigned to this new task.
  #
  # @param link [String] the url's of the task that generated the notification
  # @return [boolean] if the changes were saved in the DB
  def save_and_notify(link,current_user)
    self.user = current_user
    self.users.each do |user|
      @notification = Notification.new
      @notification.user = user
      @notification.link = link
      @notification.description = "You were assigned to a new task"
      @notification.viewed = false
      @notification.task_id = self.id
      @notification.save
    end
    return self.save
  end

  #Updates the information of the reported hours of the current user on a task
  #
  # @param instance [Instance] the instance of the application
  # @param rh [String] the ammount of hours to report
  # @param current_user [String] the id of the current user
  # @param task [String] the task in which the hours are been changed.
  def self.report_hours(instance, rh, current_user, task)
    if instance
      instance.reporting_hours = instance.reporting_hours + rh[:reporting_hours].to_f
      instance.save
    else
      instance = ReportedHours.new(rh)
      instance.task = task
      instance.user = current_user
      instance.save
    end
  end

  #Locks or unlocks a certain task
  #
  # @param task [Task] the task that is being locked or unlocked
  def self.lock_unlock(task)
    if(not task.lock == nil )
       task.lock = !task.lock
     else
       task.lock = true
     end 
     task.save
   end
end
