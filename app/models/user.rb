class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  # Taken out for heroku deploy: :confirmable
  devise :database_authenticatable, :token_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
         
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :current_password

  # attr_accessible :title, :body

  has_many :bugs
  has_many :comments

  has_many :task_users
  has_many :tasks, :through => :task_users

  has_many :project_role_users
  has_many :roles, :through => :project_role_users
  has_many :projects, :through => :project_role_users

  has_many :reported_hours

  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user
    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.username = auth.info.name
        user.email = auth.info.email
        user.avatar = auth.info.image
      end
    end
  end



end
