# Contains the project's model
class Project < ActiveRecord::Base
  attr_accessible :description, :finish_date, :initial_date, :name, :project_status_id, :dropbox_token, :github_token, :repo_name, :github_user, :labels

  belongs_to :project_status

  has_many :document_projects
  has_many :use_cases
  has_many :tasks
  has_many :bugs
  has_many :statuses
  has_many :use_case_templates
  has_many :use_case_groups
  has_many :requirements
  has_many :labels

  has_many :project_role_users, dependent: :destroy
  has_many :users, :through => :project_role_users
  has_many :roles, :through => :project_role_users

  before_create :set_starting_status
  after_create  :create_default_templates

  validates :name, :presence => true

  # Gets all the names of the repositories associated to a Github account.
  #
  # @param github_username [String] The Github account's username
  # @param git_token [String] the token of the github account
  # @return [Array] the array of name of the repositories
  def get_repo_names github_username , git_token
    repo_names = Array.new
    github = Github.new :oauth_token => git_token

    github.repos.list.body.each do |repo|
      if github_username == repo["owner"]["login"]
        repo_names << { :user=>github_username ,:repo=>repo["name"]}
      end
    end

    orgs_names = Array.new
    github.orgs.list.each do |org|
      orgs_names << org["login"]
    end

    orgs_names.each do |oname|
      url = "orgs/"+oname+"/repos"
      
      github.get_request(url,Github::ParamsHash.new({})).each do |orepo|
        if oname == orepo["owner"]["login"]
          repo_names << { :user=>oname ,:repo=>orepo["name"]}
        end
      end
    end
    repo_names
  end

  # Gets the names of all users that posses a certain repository of Github.
  #
  # @return [Array] the array of name of the users
  def get_repo_users
    repo_users = Array.new
    github = Github.new :oauth_token => github_token

    github.repos.list.body.each do |repo|
      repo_users << repo["owner"]["login"]
    end

    repo_users
  end

  # Adds a relation between a role and a user on a certain project, i.e., sets a role to a user in a project.
  #
  # @param user [String] the user' id
  # @param role [String] the role's id
  def add_user_role user, role
    user_role = ProjectRoleUser.new
    user_role.project = self
    user_role.user = user
    user_role.role = role
    user_role.save
  end

  # Counts users removing not confirmed invites
  #
  def count_confirmed_users
    count = 0
    self.users.each do |user|
      if ProjectRoleUser.where(:user_id => user.id, :project_id => self.id).first.invitation_token == nil
        count = count + 1
      elsif ProjectRoleUser.where(:user_id => user.id, :project_id => self.id).first.invitation_confirmed == true
        count = count + 1
      end
    end

    return count
  end

  # Gives the role of a certain user in the current project.
  #
  # @param user [String] the user' id
  # @return [String] the name of the role given to the user in the current project. Returns nil if there's is no user with the id given in the current project.
  def get_role user
    project_role_user = ProjectRoleUser.where(:project_id => self, :user_id => user).first
    if project_role_user
      project_role_user.role.name
    else
      nil
    end
  end



  
  # Does the hook of a commit in the project.
  def do_hook(c)
    sp = c["head_commit"]["message"].split "#"
    taskid = sp[-1].to_i
    da_task = self.tasks.find(taskid)

    if da_task then
      commit = Commit.new
      commit.author_email = c["head_commit"]["author"]["email"]
      commit.author_name = c["head_commit"]["author"]["name"]
      commit.message = c["head_commit"]["message"]
      commit.url = c["head_commit"]["url"]
      commit.sha = c["head_commit"]["id"]
      commit.date = c["head_commit"]["timestamp"]
      commit.task_id = taskid
      commit.save
    end
  end

  # Creates the hook of a commit in the project.
  def self.create_hook(project,repo_name,new_user_name)
    github = Github.new :oauth_token => project.github_token
    #Check if hook already exists
    url = URL_HOOK
    url = url.sub(":id",project.id.to_s)

    already_exists = false

    (github.repos.hooks.list new_user_name, repo_name).body.each do |hook|
      h_url = hook["config"]["url"]
      if url == h_url
        already_exists = true
      end
    end

    if !already_exists
      github.repos.hooks.create new_user_name, repo_name,
      "name" =>  "web",
      "active" => true,
      "config" => {
        "url" => url
      }
    end   
  end

  # Deletes a hook from a project.
  def self.delete_hooks(project, user, repo)

    unless project.repo_name.nil? then

      github = Github.new :oauth_token => project.github_token
      url = URL_HOOK
      url = url.sub(":id",project.id.to_s)

      hooks = (github.repos.hooks.list user, repo).body

      hooks.each do |hook|
        h_url = hook["config"]["url"]
        hook_id = hook["id"]
        if url == h_url
          github.repos.hooks.delete user, repo, hook_id
        end
      end

      repos = []
      begin
        repos = JSON.parse(project.repo_name)
      rescue
      end
      to_delete = repos.detect {|f| f["repo"] == repo }
      repos = repos - [to_delete]
      project.repo_name = repos.to_json
      project.save
    end

  end

  #Changes the name of a repository in the DB.
  def self.change_repo_name(project, new_repo_name, new_user_name)
    repos = []
    begin
      repos = JSON.parse(project.repo_name)
    rescue

    end
    is_repeat = repos.detect {|f| f["repo"] == new_repo_name }
    if is_repeat.nil?
      repos << {"user" => new_user_name, "repo" => new_repo_name}
    end
    project.repo_name = repos.to_json
    project.github_user = new_user_name
    project.save
  end


  private
      # Sets the status of the project as 'Starting'
      def set_starting_status
        self.project_status = ProjectStatus.first
      end

      # Creates the default template of the use case for the current project
      def create_default_templates
        UseCaseTemplate.create_default self
      end
  end
