class DocumentProject < ActiveRecord::Base
  attr_accessible :description, :name, :project_id, :url_path, :version, :origin

  belongs_to :project

  validates_presence_of :name, :project_id, :url_path, :version, :origin
end
