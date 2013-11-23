# Contains the label's model
class Label < ActiveRecord::Base
  attr_accessible :color, :name, :project_id, :project

  has_many :tasks
  belongs_to :project

  def valid_destroy

  	if self.tasks.count > 0
  		return false
  	else
  		self.destroy
  		return true
  	end

  end

end
