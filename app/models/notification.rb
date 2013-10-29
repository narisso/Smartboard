class Notification < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :link, :viewed, :task
  has_one :task
end
