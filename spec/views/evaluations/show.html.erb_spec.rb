require 'spec_helper'

describe "evaluations/show" do
  before(:each) do
    @evaluation = assign(:evaluation, stub_model(Evaluation,
      :task_id => 1,
      :description => "MyText",
      :name => "Name",
      :code => "Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/Name/)
    rendered.should match(/Code/)
  end
end
