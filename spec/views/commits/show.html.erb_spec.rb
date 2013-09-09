require 'spec_helper'

describe "commits/show" do
  before(:each) do
    @commit = assign(:commit, stub_model(Commit,
      :url => "Url",
      :sha => "Sha",
      :author_name => "Author Name",
      :author_email => "Author Email",
      :message => "Message",
      :task_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    rendered.should match(/Sha/)
    rendered.should match(/Author Name/)
    rendered.should match(/Author Email/)
    rendered.should match(/Message/)
    rendered.should match(/1/)
  end
end
