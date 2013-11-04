require 'spec_helper'

describe "document_use_cases/new.html.erb" do
  before(:each) do
    assign(:document_use_case, stub_model(DocumentUseCase,
      :description => "MyText",
      :name => "MyString",
      :use_case_id => 1,
      :url_path => 1
    ).as_new_record)
  end

  it "renders new document_use_case form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => document_use_cases_path, :method => "post" do
      assert_select "textarea#document_use_case_description", :name => "document_use_case[description]"
      assert_select "input#document_use_case_name", :name => "document_use_case[name]"
      assert_select "input#document_use_case_use_case_id", :name => "document_use_case[use_case_id]"
      assert_select "input#document_use_case_url_path", :name => "document_use_case[url_path]"
    end
  end
end
