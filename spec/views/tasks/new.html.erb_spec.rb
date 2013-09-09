require 'spec_helper'

describe "tasks/new" do
  before(:each) do
    assign(:task, stub_model(Task,
      :name => "MyString",
      :description => "MyText",
      :task_father => 1,
      :type => "",
      :project_id => 1,
      :status_id => 1,
      :requirement_id => 1,
      :label_id => 1,
      :estimated_hours => 1,
      :effective_hours => 1,
      :priority => 1
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tasks_path, "post" do
      assert_select "input#task_name[name=?]", "task[name]"
      assert_select "textarea#task_description[name=?]", "task[description]"
      assert_select "input#task_task_father[name=?]", "task[task_father]"
      assert_select "input#task_type[name=?]", "task[type]"
      assert_select "input#task_project_id[name=?]", "task[project_id]"
      assert_select "input#task_status_id[name=?]", "task[status_id]"
      assert_select "input#task_requirement_id[name=?]", "task[requirement_id]"
      assert_select "input#task_label_id[name=?]", "task[label_id]"
      assert_select "input#task_estimated_hours[name=?]", "task[estimated_hours]"
      assert_select "input#task_effective_hours[name=?]", "task[effective_hours]"
      assert_select "input#task_priority[name=?]", "task[priority]"
    end
  end
end
