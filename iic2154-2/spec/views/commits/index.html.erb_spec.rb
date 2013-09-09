require 'spec_helper'

describe "commits/index" do
  before(:each) do
    assign(:commits, [
      stub_model(Commit,
        :url => "Url",
        :sha => "Sha",
        :author_name => "Author Name",
        :author_email => "Author Email",
        :message => "Message",
        :task_id => 1
      ),
      stub_model(Commit,
        :url => "Url",
        :sha => "Sha",
        :author_name => "Author Name",
        :author_email => "Author Email",
        :message => "Message",
        :task_id => 1
      )
    ])
  end

  it "renders a list of commits" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Sha".to_s, :count => 2
    assert_select "tr>td", :text => "Author Name".to_s, :count => 2
    assert_select "tr>td", :text => "Author Email".to_s, :count => 2
    assert_select "tr>td", :text => "Message".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
