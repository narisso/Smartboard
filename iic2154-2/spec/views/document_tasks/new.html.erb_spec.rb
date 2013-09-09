require 'spec_helper'

describe "document_tasks/new" do
  before(:each) do
    assign(:document_task, stub_model(DocumentTask,
      :description => "MyText",
      :name => "MyString",
      :task_id => 1,
      :url_path => "MyString"
    ).as_new_record)
  end

  it "renders new document_task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", document_tasks_path, "post" do
      assert_select "textarea#document_task_description[name=?]", "document_task[description]"
      assert_select "input#document_task_name[name=?]", "document_task[name]"
      assert_select "input#document_task_task_id[name=?]", "document_task[task_id]"
      assert_select "input#document_task_url_path[name=?]", "document_task[url_path]"
    end
  end
end
