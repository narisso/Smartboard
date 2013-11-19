class DocumentProject < ActiveRecord::Base
  attr_accessible :description, :name, :project_id, :url_path, :version, :origin

  belongs_to :project
  belongs_to :requirement
  belongs_to :use_case

  has_many :document_project_requirement
  has_many :requirements, :through => :document_project_requirement

  has_many :document_project_use_case
  has_many :use_cases, :through => :document_project_use_case

  validates_presence_of :name, :project_id, :url_path, :version, :origin

  def self.create_and_upload(project,attributes, file)
  document = DocumentProject.new(attributes)

  document.project = project
  docs = DocumentProject.find_all_by_name(document.name)

  unless docs.empty? then
    document.version = docs[docs.length-1].version + 1
  end

  document.origin = "web"

  if project.dropbox_token then
    if file then
      require 'dropbox_sdk'
      file_aux = file.read
      whole_name = file.original_filename
      final_name = document.name + ".v" + document.version.to_s + File.extname(whole_name)
      file_path ="SmartBoard/" + project.name + "/" + final_name
      dbsession = DropboxSession.deserialize(project.dropbox_token)
      client = DropboxClient.new(dbsession)
      response = client.put_file(file_path, file_aux)
      link = client.shares(response["path"])
      document.url_path = link["url"]
    end
  else
    flash[:alert] = "No cloud storage linked"
  end

  return document
  end
end
