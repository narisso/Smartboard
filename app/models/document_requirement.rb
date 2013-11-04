require 'dropbox_sdk'

class DocumentRequirement < ActiveRecord::Base
  attr_accessible :description, :name, :requirement_id, :url_path

  before_create :upload_file

  belongs_to :requirement

  validates :name, :presence => true
  validates :url_path, :presence => true

  def upload_file
	project = self.requirement.project

	file = url_path.read
    whole_name = url_path.original_filename
    final_name = self.name + ".v1.0" + File.extname(whole_name)
    file_path ="SmartBoard/" + project.name + "/Requirements/" + self.name + "/" + final_name
    dbsession = DropboxSession.deserialize(project.dropbox_token)
    client = DropboxClient.new(dbsession)
    response = client.put_file(file_path, file)
    link = client.shares(response["path"])
    self.url_path = link["url"]
  end

end
