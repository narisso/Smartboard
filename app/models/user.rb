#Contains the model of the users.
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  # Taken out for heroku deploy: :confirmable

  devise :invitable, :database_authenticatable, :token_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2, :facebook]

  # Setup accessible (or protected) attributes for your model

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :current_password, :provider, :uid, :avatar, :notifications

  # attr_accessible :title, :body

  has_many :bugs
  has_many :comments, dependent: :destroy

  has_many :task_users, dependent: :destroy
  has_many :tasks, :through => :task_users

  has_many :project_role_users, dependent: :destroy
  has_many :roles, :through => :project_role_users
  has_many :projects, :through => :project_role_users

  has_many :reported_hours, :class_name => "ReportedHours", :foreign_key => "user_id"
  has_many :notifications, dependent: :destroy

  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      if user.name == nil || user.name == ""
        user.name=auth.info.name
      end
      user
    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.avatar = auth.info.image
        user.password = nil

        user.confirm!
        user.save!
      end
    end
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    if user = User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      if user.name == nil || user.name == ""
        user.name=auth.info.name
      end
      user
    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.extra.raw_info.name
        user.email = auth.info.email
        user.password = nil

        user.confirm!
        user.save!
      end
    end
  end

  #This method returns the sum of reported user hours in the tickets in JSON format
  def get_total_reported_hours(initial_date, finish_date)

      total = self.reported_hours.where("created_at >= ? and created_at < ? ", initial_date, finish_date).sum(:reporting_hours)
      return total

  end 

  #This method returns the sum of reported user hours in the tickets in JSON format
  def get_tasks_with_hours( id )
    restriction = "project_id =" + id.to_s + " and "
    restriction = restriction + "user_id = #{self.id.to_s}" 
    user_tasks = Task.joins("INNER JOIN reported_hours on tasks.id = reported_hours.task_id").where(restriction).select("name, reporting_hours as size").all
  end

  # Gives the projects of a certain user as JSON.
  #
  # @param token [String] the user's token
  # @return [String] the projects the user works with, as JSON
  def self.getProjectsAsJSon(token)
    us = User.find_by_authentication_token(token)
    
    if us and token
      id_user = us.id
      proj_of_user = ProjectRoleUser.where(:user_id => id_user)
      project_info = []
    
      proj_of_user.each do |p|
        array = {}
        array['user_name'] = us.email
        proj = Project.find(p.project_id)
        array['project_id'] = proj.id
        array['project_name'] = proj.name
        array['project_description'] = proj.description
        array['project_finish_date'] = proj.finish_date
        array['project_status'] = ProjectStatus.find(proj.project_status).name
        array['role_name'] = Role.find(p.role_id).name
        project_info << array
      end
      return :json => project_info #@pr
    else
      return :json => {:error => "Error: There's no user with given token."}
    end
  end

  # Logins the user.
  #
  # @param email [String] the user's email
  # @param password [String] the password's email
  # @return [String] the user token or a message of errror as JSON
  def self.loginAsJson(email,password)

    if email.nil? or password.nil?
      return :status=>400, :json=>{:message=>"The request must contain the user email and password."}
    end

    user=User.find_by_email(email.downcase)

    if user.nil?
      logger.info("User #{email} failed signin, user cannot be found.")
      return :status=>401, :json=>{:message=>"Invalid email or passoword."}
    end

    # http://rdoc.info/github/plataformatec/devise/master/Devise/Models/TokenAuthenticatable
    user.ensure_authentication_token!

    if not user.valid_password?(password)
      logger.info("User #{email} failed signin, password \"#{password}\" is invalid")
      return :status=>401, :json=>{:message=>"Invalid email or password."}
    else
      return :status=>200, :json=>{:token=>user.authentication_token}
    end
  end

  # Logouts the user.
  #
  # @param token [String] the user's token
  # @return [String] a message of success or failure as JSON
  def self.logoutAsJSon(token)
    user=User.find_by_authentication_token(token)
    if user.nil?
      logger.info("Token not found.")
      return :status=>404, :json=>{:message=>"Invalid token."}
    else
      user.reset_authentication_token!
      return :status=>200, :json=>{:token=>"Logout success."}
    end
  end

  # Uploads a file to a project.
  #
  # @param project_id [String] the project's id
  # @param file [File] the file to upload
  # @param token [String] the user's token
  # @param file_name [String] the file's name of the file to upload.
  # @return [String] a message of success or failure as JSON
  def self.uploadAsJSon(project_id,file,token,file_name)
    require 'dropbox_sdk'
    
    user = User.find_by_authentication_token(token)
    if user.nil?
      logger.info("Token not found.")
      return :status=>404, :json => {:message=>"Invalid token."}
    end


    if project_id.nil? 
          return :json=>{:message=>"The request must contain project id."}
    elsif file.nil?
      return :json=>{:message=>"The request must contain file."}
    end
    project = Project.find(project_id)

    if project.nil?
      return :json=>{:message=>"Project doesn't exists."}
    end

    project_of_user = ProjectRoleUser.where("user_id = ? AND project_id = ?", user.id , project_id )

    if project_of_user.nil?
      return :json=>{:message=>"User doesn't have permissions."}
    else
      
      dropbox_token = project.dropbox_token
      if dropbox_token.nil?
        return :json=>{:message=>"User doesn't have permissions."}
      else
        file = file.read
        docs =  DocumentProject.find_all_by_name(file_name)
        version = 0
        unless docs.empty? then
          version = docs[docs.length-1].version + 1
        end

        final_file_name = File.basename(file_name,File.extname(file_name)) + ".v" + version.to_s + File.extname(file_name)

        file_path = project.name + "/" + final_file_name
        begin
          dbsession = DropboxSession.deserialize(dropbox_token)
          client = DropboxClient.new(dbsession)
          response = client.put_file(file_path, file)
          puts "uploaded:", response.inspect
        rescue
          project.dropbox_token = nil
          project.save
          return :json=>{:message=>"Project has none Dropbox account associated."}
        end

        link = client.shares(response["path"])
        DocumentProject.create({name: file_name, project_id: project.id, url_path: link["url"], version: version, origin: "mobile"})

        return :json=>{:message=>response, :link=>link["url"]}
      end
    end
  end

  # Gives all the document's of a project as JSON.
  #
  # @param proj_id [String] the project's id
  # @return [String] a message of success or failure as JSON
  def self.getDocumentsAsJSon(proj_id)
    document_projects = DocumentProject.where(:project_id => proj_id)
    if document_projects.nil?
      return :json=>{:message=>"There's no project whit that id."}
    else
      return :json => document_projects
    end    
  end

end
