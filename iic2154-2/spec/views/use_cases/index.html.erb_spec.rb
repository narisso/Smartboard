require 'spec_helper'

describe "use_cases/index" do
  before(:each) do
    assign(:use_cases, [
      stub_model(UseCase,
        :name => "Name",
        :actors => "MyText",
        :synopsis => "MyText",
        :project_id => 1
      ),
      stub_model(UseCase,
        :name => "Name",
        :actors => "MyText",
        :synopsis => "MyText",
        :project_id => 1
      )
    ])
  end

  it "renders a list of use_cases" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
