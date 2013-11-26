#Contains the model of the reported hours in tasks.
class ReportedHours < ActiveRecord::Base
  attr_accessible :reporting_hours, :task_id, :user_id

  belongs_to :task, select: 'name'
  belongs_to :user

  validates :reporting_hours, :numericality => { :greater_than_or_equal_to => 1 }
end
