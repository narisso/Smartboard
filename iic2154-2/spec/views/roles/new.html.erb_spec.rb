require 'spec_helper'

describe "roles/new" do
  before(:each) do
    assign(:role, stub_model(Role,
      :name => "MyString",
      :project_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new role form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", roles_path, "post" do
      assert_select "input#role_name[name=?]", "role[name]"
      assert_select "input#role_project_id[name=?]", "role[project_id]"
      assert_select "input#role_user_id[name=?]", "role[user_id]"
    end
  end
end
