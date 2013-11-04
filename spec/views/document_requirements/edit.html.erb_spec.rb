require 'spec_helper'

describe "document_requirements/edit.html.erb" do
  before(:each) do
    @document_requirement = assign(:document_requirement, stub_model(DocumentRequirement,
      :description => "MyText",
      :name => "MyString",
      :requirement_id => 1,
      :url_path => "MyString"
    ))
  end

  it "renders the edit document_requirement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => document_requirements_path(@document_requirement), :method => "post" do
      assert_select "textarea#document_requirement_description", :name => "document_requirement[description]"
      assert_select "input#document_requirement_name", :name => "document_requirement[name]"
      assert_select "input#document_requirement_requirement_id", :name => "document_requirement[requirement_id]"
      assert_select "input#document_requirement_url_path", :name => "document_requirement[url_path]"
    end
  end
end
