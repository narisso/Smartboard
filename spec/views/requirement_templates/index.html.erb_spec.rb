require 'spec_helper'

describe "requirement_templates/index" do
  before(:each) do
    assign(:requirement_templates, [
      stub_model(RequirementTemplate,
        :name => "Name",
        :template_form => "MyText"
      ),
      stub_model(RequirementTemplate,
        :name => "Name",
        :template_form => "MyText"
      )
    ])
  end

  it "renders a list of requirement_templates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
