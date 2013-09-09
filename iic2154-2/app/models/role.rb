class Role < ActiveRecord::Base
  attr_accessible :name, :project_id, :user_id

  belongs_to :user
  belongs_to :project
end
