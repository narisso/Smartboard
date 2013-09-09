require 'spec_helper'

describe "tests/new" do
  before(:each) do
    assign(:test, stub_model(Test,
      :task_id => 1,
      :description => "MyText",
      :name => "MyString",
      :code => "MyString"
    ).as_new_record)
  end

  it "renders new test form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tests_path, "post" do
      assert_select "input#test_task_id[name=?]", "test[task_id]"
      assert_select "textarea#test_description[name=?]", "test[description]"
      assert_select "input#test_name[name=?]", "test[name]"
      assert_select "input#test_code[name=?]", "test[code]"
    end
  end
end
