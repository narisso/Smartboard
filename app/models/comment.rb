#Contains the comments' model
class Comment < ActiveRecord::Base
  attr_accessible :approved, :message, :task_id, :user_id

  #Comments can't be blank
  validates_length_of :message, :minimum => 1

  belongs_to :user
  belongs_to :task
end
