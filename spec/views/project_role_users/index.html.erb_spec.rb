require 'spec_helper'

describe "project_role_users/index" do
  before(:each) do
    assign(:project_role_users, [
      stub_model(ProjectRoleUser),
      stub_model(ProjectRoleUser)
    ])
  end

  it "renders a list of project_role_users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
