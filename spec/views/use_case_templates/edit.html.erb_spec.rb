require 'spec_helper'

describe "use_case_templates/edit" do
  before(:each) do
    @use_case_template = assign(:use_case_template, stub_model(UseCaseTemplate,
      :name => "MyString",
      :template_form => "MyText"
    ))
  end

  it "renders the edit use_case_template form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", use_case_template_path(@use_case_template), "post" do
      assert_select "input#use_case_template_name[name=?]", "use_case_template[name]"
      assert_select "textarea#use_case_template_template_form[name=?]", "use_case_template[template_form]"
    end
  end
end
