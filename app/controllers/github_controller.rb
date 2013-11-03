class GithubController < ApplicationController

attr_accessor :github

  def authorize
  	session[:return_to] = request.referer
    session[:project_id] = params[:project_id]
  	github  = Github.new :client_id => GITHUB_CLIENT_ID , :client_secret => GITHUB_CLIENT_SECRET
    address = github.authorize_url :scope => ['repo', 'user']
    redirect_to address
  end

  def callback
  	github  = Github.new :client_id => GITHUB_CLIENT_ID , :client_secret => GITHUB_CLIENT_SECRET
    if not params[:error]
      @project = Project.find(session[:project_id])
      authorization_code = params[:code]
      access_token = github.get_token authorization_code
      session[:github_session] = access_token.token   # => returns token value	
      flash[:success] = "You have successfully authorized with github."
      github.oauth_token = access_token.token
      @project.github_user = github.users.get.body["login"]
      @project.github_token = access_token.token
      @project.save
    end
    redirect_to session[:return_to]	
  end

  def github_client
    p = Project.find(params[:id])
    if p.github_token
      github = Github.new :oauth_token => p.github_token
    else
      github = Github.new :client_id => GITHUB_CLIENT_ID , :client_secret => GITHUB_CLIENT_SECRET
    end
  end

end
