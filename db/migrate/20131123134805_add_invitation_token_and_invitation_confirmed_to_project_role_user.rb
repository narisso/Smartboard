class AddInvitationTokenAndInvitationConfirmedToProjectRoleUser < ActiveRecord::Migration
  def change
  	add_column :project_role_users, :invitation_token, :string
  	add_column :project_role_users, :invitation_confirmed, :boolean
  end
end
