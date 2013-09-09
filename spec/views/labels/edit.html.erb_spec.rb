require 'spec_helper'

describe "labels/edit" do
  before(:each) do
    @label = assign(:label, stub_model(Label,
      :name => "MyString",
      :color => "MyString"
    ))
  end

  it "renders the edit label form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", label_path(@label), "post" do
      assert_select "input#label_name[name=?]", "label[name]"
      assert_select "input#label_color[name=?]", "label[color]"
    end
  end
end
