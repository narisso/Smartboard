require 'spec_helper'

describe "evaluations/index" do
  before(:each) do
    assign(:evaluations, [
      stub_model(Evaluation,
        :task_id => 1,
        :description => "MyText",
        :name => "Name",
        :code => "Code"
      ),
      stub_model(Evaluation,
        :task_id => 1,
        :description => "MyText",
        :name => "Name",
        :code => "Code"
      )
    ])
  end

  it "renders a list of evaluations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
  end
end
