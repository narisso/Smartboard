require 'spec_helper'

describe "requirement_templates/new" do
  before(:each) do
    assign(:requirement_template, stub_model(RequirementTemplate,
      :name => "MyString",
      :template_form => "MyText"
    ).as_new_record)
  end

  it "renders new requirement_template form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", requirement_templates_path, "post" do
      assert_select "input#requirement_template_name[name=?]", "requirement_template[name]"
      assert_select "textarea#requirement_template_template_form[name=?]", "requirement_template[template_form]"
    end
  end
end
