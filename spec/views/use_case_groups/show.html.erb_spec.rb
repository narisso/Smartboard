require 'spec_helper'

describe "use_case_groups/show" do
  before(:each) do
    @use_case_group = assign(:use_case_group, stub_model(UseCaseGroup,
      :name => "Name",
      :project_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
