require 'spec_helper'

describe "project_statuses/show" do
  before(:each) do
    @project_status = assign(:project_status, stub_model(ProjectStatus,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
