require 'spec_helper'

describe "test_cases/edit" do
  before(:each) do
    @test_case = assign(:test_case, stub_model(TestCase,
      :description => "MyText",
      :approved => false,
      :test_id => 1
    ))
  end

  it "renders the edit test_case form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", test_case_path(@test_case), "post" do
      assert_select "textarea#test_case_description[name=?]", "test_case[description]"
      assert_select "input#test_case_approved[name=?]", "test_case[approved]"
      assert_select "input#test_case_test_id[name=?]", "test_case[test_id]"
    end
  end
end
