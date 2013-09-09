class DocumentProject < ActiveRecord::Base
  attr_accessible :description, :name, :project_id, :url_path

  belongs_to :project
end
