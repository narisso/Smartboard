require 'spec_helper'

describe "task_users/index" do
  before(:each) do
    assign(:task_users, [
      stub_model(TaskUser,
        :task_id => 1,
        :user_id => 2,
        :developer_id => 3,
        :creator_id => 4
      ),
      stub_model(TaskUser,
        :task_id => 1,
        :user_id => 2,
        :developer_id => 3,
        :creator_id => 4
      )
    ])
  end

  it "renders a list of task_users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
