require 'spec_helper'

describe "document_use_cases/index.html.erb" do
  before(:each) do
    assign(:document_use_cases, [
      stub_model(DocumentUseCase,
        :description => "MyText",
        :name => "Name",
        :use_case_id => 1,
        :url_path => 1
      ),
      stub_model(DocumentUseCase,
        :description => "MyText",
        :name => "Name",
        :use_case_id => 1,
        :url_path => 1
      )
    ])
  end

  it "renders a list of document_use_cases" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
