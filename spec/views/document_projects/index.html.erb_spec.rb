require 'spec_helper'

describe "document_projects/index" do
  before(:each) do
    assign(:document_projects, [
      stub_model(DocumentProject,
        :name => "Name",
        :description => "MyText",
        :url_path => "Url Path",
        :project_id => 1
      ),
      stub_model(DocumentProject,
        :name => "Name",
        :description => "MyText",
        :url_path => "Url Path",
        :project_id => 1
      )
    ])
  end

  it "renders a list of document_projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url Path".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
