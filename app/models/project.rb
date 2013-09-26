class Project < ActiveRecord::Base
  attr_accessible :description, :finish_date, :initial_date, :name, :project_status_id

  belongs_to :project_status

  has_many :document_projects
  has_many :use_cases
  has_many :tasks
  has_many :bugs

<<<<<<< HEAD
  has_many :project_role_users, :dependent => :destroy
=======
  has_many :project_role_users
>>>>>>> 34826f8cdf9a324a2e0b3ab80db2f06d5bad68aa
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

<<<<<<< HEAD
=======
  def get_role user
    project_role_user = ProjectRoleUser.where(:project_id => self, :user_id => user).first
    project_role_user.role.name
  end

>>>>>>> 34826f8cdf9a324a2e0b3ab80db2f06d5bad68aa
  private
    def set_starting_status
      self.project_status = ProjectStatus.first
    end

end
