require 'spec_helper'

describe "use_case_groups/index" do
  before(:each) do
    assign(:use_case_groups, [
      stub_model(UseCaseGroup,
        :name => "Name",
        :project_id => 1
      ),
      stub_model(UseCaseGroup,
        :name => "Name",
        :project_id => 1
      )
    ])
  end

  it "renders a list of use_case_groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
