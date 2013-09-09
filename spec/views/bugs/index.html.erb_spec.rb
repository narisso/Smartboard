require 'spec_helper'

describe "bugs/index" do
  before(:each) do
    assign(:bugs, [
      stub_model(Bug,
        :description => "MyText",
        :user_id => 1,
        :project_id => 2,
        :test_case_id => 3,
        :task_id => 4
      ),
      stub_model(Bug,
        :description => "MyText",
        :user_id => 1,
        :project_id => 2,
        :test_case_id => 3,
        :task_id => 4
      )
    ])
  end

  it "renders a list of bugs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
