require 'spec_helper'

describe "labels/index" do
  before(:each) do
    assign(:labels, [
      stub_model(Label,
        :name => "Name",
        :color => "Color"
      ),
      stub_model(Label,
        :name => "Name",
        :color => "Color"
      )
    ])
  end

  it "renders a list of labels" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
  end
end
