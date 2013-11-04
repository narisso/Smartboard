require 'spec_helper'

describe "document_requirements/show.html.erb" do
  before(:each) do
    @document_requirement = assign(:document_requirement, stub_model(DocumentRequirement,
      :description => "MyText",
      :name => "Name",
      :requirement_id => 1,
      :url_path => "Url Path"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url Path/)
  end
end
