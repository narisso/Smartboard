require 'spec_helper'

describe "commits/new" do
  before(:each) do
    assign(:commit, stub_model(Commit,
      :url => "MyString",
      :sha => "MyString",
      :author_name => "MyString",
      :author_email => "MyString",
      :message => "MyString",
      :task_id => 1
    ).as_new_record)
  end

  it "renders new commit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", commits_path, "post" do
      assert_select "input#commit_url[name=?]", "commit[url]"
      assert_select "input#commit_sha[name=?]", "commit[sha]"
      assert_select "input#commit_author_name[name=?]", "commit[author_name]"
      assert_select "input#commit_author_email[name=?]", "commit[author_email]"
      assert_select "input#commit_message[name=?]", "commit[message]"
      assert_select "input#commit_task_id[name=?]", "commit[task_id]"
    end
  end
end
