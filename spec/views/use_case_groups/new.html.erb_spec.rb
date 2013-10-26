require 'spec_helper'

describe "use_case_groups/new" do
  before(:each) do
    assign(:use_case_group, stub_model(UseCaseGroup,
      :name => "MyString",
      :project_id => 1
    ).as_new_record)
  end

  it "renders new use_case_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", use_case_groups_path, "post" do
      assert_select "input#use_case_group_name[name=?]", "use_case_group[name]"
      assert_select "input#use_case_group_project_id[name=?]", "use_case_group[project_id]"
    end
  end
end
