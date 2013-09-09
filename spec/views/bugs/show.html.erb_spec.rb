require 'spec_helper'

describe "bugs/show" do
  before(:each) do
    @bug = assign(:bug, stub_model(Bug,
      :description => "MyText",
      :user_id => 1,
      :project_id => 2,
      :test_case_id => 3,
      :task_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
