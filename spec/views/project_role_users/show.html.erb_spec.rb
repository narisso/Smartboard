require 'spec_helper'

describe "project_role_users/show" do
  before(:each) do
    @project_role_user = assign(:project_role_user, stub_model(ProjectRoleUser))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
