require 'spec_helper'

describe "ProjectRoleUsers" do
  describe "GET /project_role_users" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get project_role_users_path
      response.status.should be(200)
    end
  end
end
