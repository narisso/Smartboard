require 'spec_helper'

describe "document_requirements/new.html.erb" do
  before(:each) do
    assign(:document_requirement, stub_model(DocumentRequirement,
      :description => "MyText",
      :name => "MyString",
      :requirement_id => 1,
      :url_path => "MyString"
    ).as_new_record)
  end

  it "renders new document_requirement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => document_requirements_path, :method => "post" do
      assert_select "textarea#document_requirement_description", :name => "document_requirement[description]"
      assert_select "input#document_requirement_name", :name => "document_requirement[name]"
      assert_select "input#document_requirement_requirement_id", :name => "document_requirement[requirement_id]"
      assert_select "input#document_requirement_url_path", :name => "document_requirement[url_path]"
    end
  end
end
