require 'spec_helper'

describe "task_users/show" do
  before(:each) do
    @task_user = assign(:task_user, stub_model(TaskUser,
      :task_id => 1,
      :user_id => 2,
      :developer_id => 3,
      :creator_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
