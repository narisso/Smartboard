require 'spec_helper'

describe "comments/new" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :user_id => 1,
      :task_id => 1,
      :message => "MyText",
      :approved => false
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comments_path, "post" do
      assert_select "input#comment_user_id[name=?]", "comment[user_id]"
      assert_select "input#comment_task_id[name=?]", "comment[task_id]"
      assert_select "textarea#comment_message[name=?]", "comment[message]"
      assert_select "input#comment_approved[name=?]", "comment[approved]"
    end
  end
end
