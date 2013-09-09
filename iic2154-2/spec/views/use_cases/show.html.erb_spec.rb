require 'spec_helper'

describe "use_cases/show" do
  before(:each) do
    @use_case = assign(:use_case, stub_model(UseCase,
      :name => "Name",
      :actors => "MyText",
      :synopsis => "MyText",
      :project_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
