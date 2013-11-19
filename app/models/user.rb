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
        user.password = auth.info.password

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
        user.password = Devise.friendly_token[0,20]

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

  def get_tasks_with_hours
    restriction = "user_id = #{self.id.to_s}" 
    user_tasks = Task.joins("INNER JOIN reported_hours on tasks.id = reported_hours.task_id").where(restriction).select("name, reporting_hours as size").all
  end

end
