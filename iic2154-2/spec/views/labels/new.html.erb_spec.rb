require 'spec_helper'

describe "labels/new" do
  before(:each) do
    assign(:label, stub_model(Label,
      :name => "MyString",
      :color => "MyString"
    ).as_new_record)
  end

  it "renders new label form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", labels_path, "post" do
      assert_select "input#label_name[name=?]", "label[name]"
      assert_select "input#label_color[name=?]", "label[color]"
    end
  end
end
