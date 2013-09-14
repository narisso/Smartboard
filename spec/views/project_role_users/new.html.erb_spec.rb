require 'spec_helper'

describe "project_role_users/new" do
  before(:each) do
    assign(:project_role_user, stub_model(ProjectRoleUser).as_new_record)
  end

  it "renders new project_role_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_role_users_path, "post" do
    end
  end
end
