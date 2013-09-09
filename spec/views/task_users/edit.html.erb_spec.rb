require 'spec_helper'

describe "task_users/edit" do
  before(:each) do
    @task_user = assign(:task_user, stub_model(TaskUser,
      :task_id => 1,
      :user_id => 1,
      :developer_id => 1,
      :creator_id => 1
    ))
  end

  it "renders the edit task_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", task_user_path(@task_user), "post" do
      assert_select "input#task_user_task_id[name=?]", "task_user[task_id]"
      assert_select "input#task_user_user_id[name=?]", "task_user[user_id]"
      assert_select "input#task_user_developer_id[name=?]", "task_user[developer_id]"
      assert_select "input#task_user_creator_id[name=?]", "task_user[creator_id]"
    end
  end
end
