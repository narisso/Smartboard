require 'spec_helper'

describe "use_case_groups/edit" do
  before(:each) do
    @use_case_group = assign(:use_case_group, stub_model(UseCaseGroup,
      :name => "MyString",
      :project_id => 1
    ))
  end

  it "renders the edit use_case_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", use_case_group_path(@use_case_group), "post" do
      assert_select "input#use_case_group_name[name=?]", "use_case_group[name]"
      assert_select "input#use_case_group_project_id[name=?]", "use_case_group[project_id]"
    end
  end
end
