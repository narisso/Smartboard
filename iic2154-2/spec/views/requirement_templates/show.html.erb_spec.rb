require 'spec_helper'

describe "requirement_templates/show" do
  before(:each) do
    @requirement_template = assign(:requirement_template, stub_model(RequirementTemplate,
      :name => "Name",
      :template_form => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
