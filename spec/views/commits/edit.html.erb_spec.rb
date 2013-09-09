require 'spec_helper'

describe "commits/edit" do
  before(:each) do
    @commit = assign(:commit, stub_model(Commit,
      :url => "MyString",
      :sha => "MyString",
      :author_name => "MyString",
      :author_email => "MyString",
      :message => "MyString",
      :task_id => 1
    ))
  end

  it "renders the edit commit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", commit_path(@commit), "post" do
      assert_select "input#commit_url[name=?]", "commit[url]"
      assert_select "input#commit_sha[name=?]", "commit[sha]"
      assert_select "input#commit_author_name[name=?]", "commit[author_name]"
      assert_select "input#commit_author_email[name=?]", "commit[author_email]"
      assert_select "input#commit_message[name=?]", "commit[message]"
      assert_select "input#commit_task_id[name=?]", "commit[task_id]"
    end
  end
end
