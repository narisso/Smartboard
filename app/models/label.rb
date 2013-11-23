# Contains the label's model
class Label < ActiveRecord::Base
  attr_accessible :color, :name, :project_id, :project

  has_many :tasks
  belongs_to :project

  def get_tasks(initial_date, final_date)
  	self.tasks.where("created_at >= ? and created_at <= ?", initial_date, final_date) 
  end
end
