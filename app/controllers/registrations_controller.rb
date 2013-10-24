class RegistrationsController < Devise::RegistrationsController

  skip_before_filter :check_session , :only => [:new, :create]

 
end