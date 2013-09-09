require 'spec_helper'

describe "labels/show" do
  before(:each) do
    @label = assign(:label, stub_model(Label,
      :name => "Name",
      :color => "Color"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Color/)
  end
end
