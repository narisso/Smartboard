class Project < ActiveRecord::Base
  attr_accessible :description, :finish_date, :initial_date, :name, :status
end
