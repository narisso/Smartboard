#Contains the status' model
class Status < ActiveRecord::Base

  attr_accessible :name, :project_id, :order, :task_order_string
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

  def tasks_ordered
    my_tasks = self.tasks
    task_order = JSON.parse(self.task_order_string)
    new_tasks = []

    my_tasks.each_with_index do |task,i|
      new_tasks << my_tasks.detect{|t| t.id == task_order[i]}
    end

    if my_tasks.count != new_tasks.count
      self.set_task_order_string_by_date
      self.save
      return self.tasks_ordered
    end

    return new_tasks
  end

  def set_task_order_string_by_date
    tasks = self.tasks.order('tasks.created_at DESC')
    new_order = []
    tasks.each do |task|
      new_order << task.id
    end
    self.task_order_string = new_order.to_s
  end

  def insert_into_task_order( index , task_id )
    unless task_id.nil? or ! task_id.is_a? Fixnum or index.nil? or ! index.is_a? Fixnum
      task_order = JSON.parse(self.task_order_string)
      if task_order.include? task_id
        task_order.delete(task_id)
      end
      task_order.insert( index,task_id )
      self.task_order_string = task_order.to_s
    end
  end

  def delete_from_task_order( task_id )
    unless task_id.nil? or ! task_id.is_a? Fixnum
      task_order = JSON.parse(self.task_order_string)
      task_order.delete(task_id)
      self.task_order_string = task_order.to_s
    end
  end


end
