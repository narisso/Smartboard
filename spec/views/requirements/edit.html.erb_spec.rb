require 'spec_helper'

describe "requirements/edit" do
  before(:each) do
    @requirement = assign(:requirement, stub_model(Requirement,
      :name => "MyString",
      :type => "",
      :data => "MyText",
      :template_id => 1,
      :use_case_id => 1
    ))
  end

  it "renders the edit requirement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", requirement_path(@requirement), "post" do
      assert_select "input#requirement_name[name=?]", "requirement[name]"
      assert_select "input#requirement_type[name=?]", "requirement[type]"
      assert_select "textarea#requirement_data[name=?]", "requirement[data]"
      assert_select "input#requirement_template_id[name=?]", "requirement[template_id]"
      assert_select "input#requirement_use_case_id[name=?]", "requirement[use_case_id]"
    end
  end
end
