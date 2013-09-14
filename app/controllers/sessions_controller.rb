class SessionsController <  Devise::SessionsController

	skip_before_filter :check_session , :only => [:new, :create]

end
