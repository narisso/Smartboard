require 'spec_helper'

describe "document_tasks/index" do
  before(:each) do
    assign(:document_tasks, [
      stub_model(DocumentTask,
        :description => "MyText",
        :name => "Name",
        :task_id => 1,
        :url_path => "Url Path"
      ),
      stub_model(DocumentTask,
        :description => "MyText",
        :name => "Name",
        :task_id => 1,
        :url_path => "Url Path"
      )
    ])
  end

  it "renders a list of document_tasks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Url Path".to_s, :count => 2
  end
end
