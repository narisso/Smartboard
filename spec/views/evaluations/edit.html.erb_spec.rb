require 'spec_helper'

describe "evaluations/edit" do
  before(:each) do
    @evaluation = assign(:evaluation, stub_model(Evaluation,
      :task_id => 1,
      :description => "MyText",
      :name => "MyString",
      :code => "MyString"
    ))
  end

  it "renders the edit evaluation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", evaluation_path(@evaluation), "post" do
      assert_select "input#evaluation_task_id[name=?]", "evaluation[task_id]"
      assert_select "textarea#evaluation_description[name=?]", "evaluation[description]"
      assert_select "input#evaluation_name[name=?]", "evaluation[name]"
      assert_select "input#evaluation_code[name=?]", "evaluation[code]"
    end
  end
end
