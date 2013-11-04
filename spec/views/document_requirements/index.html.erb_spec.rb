require 'spec_helper'

describe "document_requirements/index.html.erb" do
  before(:each) do
    assign(:document_requirements, [
      stub_model(DocumentRequirement,
        :description => "MyText",
        :name => "Name",
        :requirement_id => 1,
        :url_path => "Url Path"
      ),
      stub_model(DocumentRequirement,
        :description => "MyText",
        :name => "Name",
        :requirement_id => 1,
        :url_path => "Url Path"
      )
    ])
  end

  it "renders a list of document_requirements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url Path".to_s, :count => 2
  end
end
