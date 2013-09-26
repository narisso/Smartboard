class DropboxController < ApplicationController
require 'dropbox_sdk'
def authorize
	flow = DropboxOAuth2FlowNoRedirect.new(DROPBOX_APP_KEY, DROPBOX_APP_KEY_SECRET)
 authorize_url = flow.start()
dbsession = DropboxSession.new(DROPBOX_APP_KEY, DROPBOX_APP_KEY_SECRET)
#serialize and save this DropboxSession
session[:dropbox_session] = dbsession.serialize
#pass to get_authorize_url a callback url that will return the user here
redirect_to dbsession.get_authorize_url url_for(:action => 'callback')
 
end
 
# @Params : None
# @Return : None
# @Purpose : To callback for dropbox authorization
def callback
 
dbsession = DropboxSession.deserialize(session[:dropbox_session])
dbsession.get_access_token #we've been authorized, so now request an access_token
session[:dropbox_session] = dbsession.serialize
session.delete :dropbox_session
flash[:success] = "You have successfully authorized with dropbox."
 
redirect_to root_path
 
end # end of dropbox_callback action

end
