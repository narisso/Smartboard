class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
<<<<<<< HEAD
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
=======

  # Taken out for heroku deploy: :confirmable
  devise :database_authenticatable, :token_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         
>>>>>>> 34826f8cdf9a324a2e0b3ab80db2f06d5bad68aa

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
end
