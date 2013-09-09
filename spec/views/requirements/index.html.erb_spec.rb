require 'spec_helper'

describe "requirements/index" do
  before(:each) do
    assign(:requirements, [
      stub_model(Requirement,
        :name => "Name",
        :type => "Type",
        :data => "MyText",
        :template_id => 1,
        :use_case_id => 2
      ),
      stub_model(Requirement,
        :name => "Name",
        :type => "Type",
        :data => "MyText",
        :template_id => 1,
        :use_case_id => 2
      )
    ])
  end

  it "renders a list of requirements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
