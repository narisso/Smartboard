require 'spec_helper'

describe "use_cases/edit" do
  before(:each) do
    @use_case = assign(:use_case, stub_model(UseCase,
      :name => "MyString",
      :actors => "MyText",
      :synopsis => "MyText",
      :project_id => 1
    ))
  end

  it "renders the edit use_case form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", use_case_path(@use_case), "post" do
      assert_select "input#use_case_name[name=?]", "use_case[name]"
      assert_select "textarea#use_case_actors[name=?]", "use_case[actors]"
      assert_select "textarea#use_case_synopsis[name=?]", "use_case[synopsis]"
      assert_select "input#use_case_project_id[name=?]", "use_case[project_id]"
    end
  end
end
