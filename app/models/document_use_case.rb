require 'dropbox_sdk'

class DocumentUseCase < ActiveRecord::Base
  attr_accessible :description, :name, :url_path, :use_case_id

  before_create :upload_file

  belongs_to :use_case

  validates :name, :presence => true
  validates :url_path, :presence => true

  def upload_file
	project = self.use_case.project

	file = url_path.read
    whole_name = url_path.original_filename
    final_name = self.name + ".v1.0" + File.extname(whole_name)
    file_path ="SmartBoard/" + project.name + "/UseCases/" + self.name + "/" + final_name
    dbsession = DropboxSession.deserialize(project.dropbox_token)
    client = DropboxClient.new(dbsession)
    response = client.put_file(file_path, file)
    link = client.shares(response["path"])
    self.url_path = link["url"]
  end

end
