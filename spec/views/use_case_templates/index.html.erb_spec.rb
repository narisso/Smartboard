require 'spec_helper'

describe "use_case_templates/index" do
  before(:each) do
    assign(:use_case_templates, [
      stub_model(UseCaseTemplate,
        :name => "Name",
        :template_form => "MyText"
      ),
      stub_model(UseCaseTemplate,
        :name => "Name",
        :template_form => "MyText"
      )
    ])
  end

  it "renders a list of use_case_templates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
