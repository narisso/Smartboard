require 'spec_helper'

describe "use_case_templates/show" do
  before(:each) do
    @use_case_template = assign(:use_case_template, stub_model(UseCaseTemplate,
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
