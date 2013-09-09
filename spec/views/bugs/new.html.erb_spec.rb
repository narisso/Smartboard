require 'spec_helper'

describe "bugs/new" do
  before(:each) do
    assign(:bug, stub_model(Bug,
      :description => "MyText",
      :user_id => 1,
      :project_id => 1,
      :test_case_id => 1,
      :task_id => 1
    ).as_new_record)
  end

  it "renders new bug form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bugs_path, "post" do
      assert_select "textarea#bug_description[name=?]", "bug[description]"
      assert_select "input#bug_user_id[name=?]", "bug[user_id]"
      assert_select "input#bug_project_id[name=?]", "bug[project_id]"
      assert_select "input#bug_test_case_id[name=?]", "bug[test_case_id]"
      assert_select "input#bug_task_id[name=?]", "bug[task_id]"
    end
  end
end