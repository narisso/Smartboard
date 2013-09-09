require 'spec_helper'

describe "document_projects/edit" do
  before(:each) do
    @document_project = assign(:document_project, stub_model(DocumentProject,
      :name => "MyString",
      :description => "MyText",
      :url_path => "MyString",
      :project_id => 1
    ))
  end

  it "renders the edit document_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", document_project_path(@document_project), "post" do
      assert_select "input#document_project_name[name=?]", "document_project[name]"
      assert_select "textarea#document_project_description[name=?]", "document_project[description]"
      assert_select "input#document_project_url_path[name=?]", "document_project[url_path]"
      assert_select "input#document_project_project_id[name=?]", "document_project[project_id]"
    end
  end
end
