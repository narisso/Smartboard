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
  has_many :comments

  has_many :task_users
  has_many :tasks, :through => :task_users

  has_many :project_role_users
  has_many :roles, :through => :project_role_users
  has_many :projects, :through => :project_role_users

  has_many :reported_hours
  has_many :notifications



  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user
    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.avatar = auth.info.image
        user.password = auth.info.password

        user.confirm!
        user.save!
      end
    end
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20]
                           )
      user.confirm!
      user.save!
    end
    user
  end




end
