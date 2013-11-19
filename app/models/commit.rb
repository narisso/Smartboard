# Contains the commits' model
class Commit < ActiveRecord::Base
  attr_accessible :author_email, :author_name, :date, :message, :sha, :task_id, :url

  belongs_to :task
end
