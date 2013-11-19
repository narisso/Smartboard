class Project < ActiveRecord::Base
  attr_accessible :description, :finish_date, :initial_date, :name, :project_status_id, :dropbox_token, :github_token, :repo_name, :github_user

  belongs_to :project_status

  has_many :document_projects
  has_many :use_cases
  has_many :tasks
  has_many :bugs
  has_many :statuses
  has_many :use_case_templates
  has_many :use_case_groups
  has_many :requirements

  has_many :project_role_users, dependent: :destroy
  has_many :users, :through => :project_role_users
  has_many :roles, :through => :project_role_users

  before_create :set_starting_status
  after_create  :create_default_templates

  validates :name, :presence => true

  def get_repo_names github_username , git_token
    repo_names = Array.new
    github = Github.new :oauth_token => git_token

    github.repos.list.body.each do |repo|
      if github_username == repo["owner"]["login"]
        repo_names << repo["name"]
      end
    end

    repo_names
  end

  def get_repo_users
    repo_users = Array.new
    github = Github.new :oauth_token => github_token

    github.repos.list.body.each do |repo|
      repo_users << repo["owner"]["login"]
    end

    repo_users
  end

  def add_user_role user, role
    user_role = ProjectRoleUser.new
    user_role.project = self
    user_role.user = user
    user_role.role = role
    user_role.save
  end

  def get_role user
    project_role_user = ProjectRoleUser.where(:project_id => self, :user_id => user).first
    if project_role_user
      project_role_user.role.name
    else
      nil
    end
  end

  private
    def set_starting_status
      self.project_status = ProjectStatus.first
    end

    def create_default_templates
      UseCaseTemplate.create_default self
    end

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

    def create_hook(project)

      github = Github.new :oauth_token => project.github_token

      #Check if hook already exists

      url = URL_HOOK
      url = url.sub(":id",project.id.to_s)


      already_exists = false

      (github.repos.hooks.list project.github_user, project.repo_name).body.each do |hook|
        h_url = hook["config"]["url"]
        if url == h_url
          already_exists = true
        end
      end



      if !already_exists
        github.repos.hooks.create project.github_user, project.repo_name,
          "name" =>  "web",
          "active" => true,
          "config" => {
            "url" => url
          }

      end
      
    end

    def delete_hooks(project)

      unless project.repo_name.nil? then

        github = Github.new :oauth_token => project.github_token
        url = URL_HOOK
        url = url.sub(":id",project.id.to_s)

        hooks = (github.repos.hooks.list project.github_user, project.repo_name).body

        hooks.each do |hook|
          h_url = hook["config"]["url"]
          hook_id = hook["id"]
          if url == h_url
            github.repos.hooks.delete project.github_user, project.repo_name, hook_id
          end
        end

      end

    end

    def change_repo_name(project,new_repo_name)

      old_repo_name = project.repo_name

      project.repo_name = new_repo_name
      project.save

    end
end
