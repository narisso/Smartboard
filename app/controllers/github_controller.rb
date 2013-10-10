class GithubController < ApplicationController

  attr_accessor :github


  def authorize
  	session[:return_to] = request.referer
  	github  = Github.new :client_id => GITHUB_CLIENT_ID , :client_secret => GITHUB_CLIENT_SECRET
    address = github.authorize_url scope: 'repo'
    redirect_to address
  end

  def callback
  	github  = Github.new :client_id => GITHUB_CLIENT_ID , :client_secret => GITHUB_CLIENT_SECRET
    authorization_code = params[:code]
    access_token = github.get_token authorization_code
    session[:github_session] = access_token.token   # => returns token value	
    flash[:success] = "You have successfully authorized with github."
    redirect_to session[:return_to]	
  end
end
