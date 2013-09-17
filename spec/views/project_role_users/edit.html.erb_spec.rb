require 'spec_helper'

describe "project_role_users/edit" do
  before(:each) do
    @project_role_user = assign(:project_role_user, stub_model(ProjectRoleUser))
  end

  it "renders the edit project_role_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_role_user_path(@project_role_user), "post" do
    end
  end
end
