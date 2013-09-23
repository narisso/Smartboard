require 'spec_helper'

describe "test_cases/new" do
  before(:each) do
    assign(:test_case, stub_model(TestCase,
      :description => "MyText",
      :approved => false,
      :evaluation_id => 1
    ).as_new_record)
  end

  it "renders new test_case form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", test_cases_path, "post" do
      assert_select "textarea#test_case_description[name=?]", "test_case[description]"
      assert_select "input#test_case_approved[name=?]", "test_case[approved]"
      assert_select "input#test_case_evaluation_id[name=?]", "test_case[evaluation_id]"
    end
  end
end
