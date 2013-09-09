require 'spec_helper'

describe "document_tasks/show" do
  before(:each) do
    @document_task = assign(:document_task, stub_model(DocumentTask,
      :description => "MyText",
      :name => "Name",
      :task_id => 1,
      :url_path => "Url Path"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/Url Path/)
  end
end
