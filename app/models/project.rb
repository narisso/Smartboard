class Project < ActiveRecord::Base
  attr_accessible :description, :finish_date, :initial_date, :name, :project_status_id, :dropbox_token

  belongs_to :project_status

  has_many :document_projects
  has_many :use_cases
  has_many :tasks
  has_many :bugs
  has_many :statuses

  has_many :project_role_users
  has_many :users, :through => :project_role_users
  has_many :roles, :through => :project_role_users

  before_create :set_starting_status

  validates :name, :presence => true

  def add_user_role user, role
    user_role = ProjectRoleUser.new
    user_role.project = self
    user_role.user = user
    user_role.role = role
    user_role.save
  end

  def get_role user
    project_role_user = ProjectRoleUser.where(:project_id => self, :user_id => user).first
    project_role_user.role.name
  end

  private
    def set_starting_status
      self.project_status = ProjectStatus.first
    end

end
