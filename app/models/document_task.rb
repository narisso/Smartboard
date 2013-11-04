require 'dropbox_sdk'

class DocumentTask < ActiveRecord::Base
  attr_accessible :description, :name, :task_id, :url_path

  before_create :upload_file

  belongs_to :task

  validates :name, :presence => true
  validates :url_path, :presence => true

  def upload_file
	project = self.task.project
	task = self.task

	file = url_path.read
    whole_name = url_path.original_filename
    final_name = self.task.project.name + ".v1.0" + File.extname(whole_name)
    file_path ="SmartBoard/" + project.name + "/" + task.name + "/" + final_name
    dbsession = DropboxSession.deserialize(project.dropbox_token)
    client = DropboxClient.new(dbsession)
    response = client.put_file(file_path, file)
    link = client.shares(response["path"])
    self.url_path = link["url"]
  end

end
