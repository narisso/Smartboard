class Status < ActiveRecord::Base

  attr_accessible :name, :project_id, :order
  validates :name, :project_id, :order, presence: true

  has_many :tasks
  belongs_to :project

  def set_default_name (aux)
  	if self.name == "" || self.name == nil
      self.name = "Default"+aux.to_s
    end
  end
end
