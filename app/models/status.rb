#Contains the status' model
class Status < ActiveRecord::Base

  attr_accessible :name, :project_id, :order
  validates :name, :project_id, :order, presence: true

  has_many :tasks
  belongs_to :project

  #Sets the default name of a task with no name.
  #
  # @param aux [Integer] the counter off default tasks in the project
  def set_default_name (aux)
  	if self.name == "" || self.name == nil
      self.name = "Default"+aux.to_s
    end
  end

  #See if there is no tasks in the status, and destroy the status if it's posible
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
