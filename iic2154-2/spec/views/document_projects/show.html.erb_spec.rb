require 'spec_helper'

describe "document_projects/show" do
  before(:each) do
    @document_project = assign(:document_project, stub_model(DocumentProject,
      :name => "Name",
      :description => "MyText",
      :url_path => "Url Path",
      :project_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Url Path/)
    rendered.should match(/1/)
  end
end
