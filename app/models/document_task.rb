class DocumentTask < ActiveRecord::Base
  attr_accessible :description, :name, :task_id, :url_path

  belongs_to :task
end
