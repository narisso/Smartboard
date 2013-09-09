require 'spec_helper'

describe "requirement_templates/edit" do
  before(:each) do
    @requirement_template = assign(:requirement_template, stub_model(RequirementTemplate,
      :name => "MyString",
      :template_form => "MyText"
    ))
  end

  it "renders the edit requirement_template form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", requirement_template_path(@requirement_template), "post" do
      assert_select "input#requirement_template_name[name=?]", "requirement_template[name]"
      assert_select "textarea#requirement_template_template_form[name=?]", "requirement_template[template_form]"
    end
  end
end
