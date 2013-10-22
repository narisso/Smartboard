require 'spec_helper'

describe "use_case_templates/new" do
  before(:each) do
    assign(:use_case_template, stub_model(UseCaseTemplate,
      :name => "MyString",
      :template_form => "MyText"
    ).as_new_record)
  end

  it "renders new use_case_template form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", use_case_templates_path, "post" do
      assert_select "input#use_case_template_name[name=?]", "use_case_template[name]"
      assert_select "textarea#use_case_template_template_form[name=?]", "use_case_template[template_form]"
    end
  end
end
