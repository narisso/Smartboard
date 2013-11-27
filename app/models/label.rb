# Contains the label's model
class Label < ActiveRecord::Base
  attr_accessible :color, :name, :project_id, :project

  has_many :tasks
  belongs_to :project

  # Gives all tasks for between two dates
  #
  # @param initial_date [String]
  # @param final_date [String]
  # @return [Array] an array with tasks
  def get_tasks(initial_date, final_date)
  	self.tasks.where("created_at >= ? and created_at <= ?", initial_date, final_date) 
  end

  #See if there is no tasks with this label, and destroy the label if it's posible
  #
  # 
  def valid_destroy
  	if self.tasks.count > 0
  		return false
  	else
  		self.destroy
  		return true
  	end
  end

end
