require 'spec_helper'

describe "document_tasks/edit" do
  before(:each) do
    @document_task = assign(:document_task, stub_model(DocumentTask,
      :description => "MyText",
      :name => "MyString",
      :task_id => 1,
      :url_path => "MyString"
    ))
  end

  it "renders the edit document_task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", document_task_path(@document_task), "post" do
      assert_select "textarea#document_task_description[name=?]", "document_task[description]"
      assert_select "input#document_task_name[name=?]", "document_task[name]"
      assert_select "input#document_task_task_id[name=?]", "document_task[task_id]"
      assert_select "input#document_task_url_path[name=?]", "document_task[url_path]"
    end
  end
end
