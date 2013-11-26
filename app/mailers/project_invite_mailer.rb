class ProjectInviteMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_invitation(project_role_user,email)
  	@project_role_user = project_role_user
  	@email = email
  	@token = @project_role_user.invitation_token

  	mail(:to => @email, :subject => "You were invited to a project!")
  end
end
