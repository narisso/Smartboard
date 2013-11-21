#Contains the subtask's model
class SubTask < ActiveRecord::Base
  attr_accessible :curr_state, :description, :name

  belongs_to :task

  validates :name, :presence => true

end
