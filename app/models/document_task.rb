require 'dropbox_sdk'

#Contains the model of the documents of the task.
class DocumentTask < ActiveRecord::Base
  attr_accessible :description, :name, :task_id, :url_path, :version, :original_name

  before_create :upload_file

  belongs_to :task

  validates :name, :presence => true
  validates :url_path, :presence => true

  # Uploads a file to a task's directory of Dropbox
  def upload_file
    project = self.task.project
    task = self.task

    file = url_path.read
    self.original_name = url_path.original_filename
    self.version = DocumentTask.where(:name => self.name).count + 1

    final_name = "#{self.name}.v#{self.version}#{File.extname(original_name)}"
    file_path  = project.name + "/" + task.name + "/" + final_name
    dbsession = DropboxSession.deserialize(project.dropbox_token)
    client = DropboxClient.new(dbsession)
    response = client.put_file(file_path, file)
    link = client.shares(response["path"])
    self.url_path = link["url"]
  end

end
