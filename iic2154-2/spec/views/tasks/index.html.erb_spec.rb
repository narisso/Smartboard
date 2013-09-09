require 'spec_helper'

describe "tasks/index" do
  before(:each) do
    assign(:tasks, [
      stub_model(Task,
        :name => "Name",
        :description => "MyText",
        :task_father => 1,
        :type => "Type",
        :project_id => 2,
        :status_id => 3,
        :requirement_id => 4,
        :label_id => 5,
        :estimated_hours => 6,
        :effective_hours => 7,
        :priority => 8
      ),
      stub_model(Task,
        :name => "Name",
        :description => "MyText",
        :task_father => 1,
        :type => "Type",
        :project_id => 2,
        :status_id => 3,
        :requirement_id => 4,
        :label_id => 5,
        :estimated_hours => 6,
        :effective_hours => 7,
        :priority => 8
      )
    ])
  end

  it "renders a list of tasks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
  end
end
