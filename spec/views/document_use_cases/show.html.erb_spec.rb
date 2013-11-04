require 'spec_helper'

describe "document_use_cases/show.html.erb" do
  before(:each) do
    @document_use_case = assign(:document_use_case, stub_model(DocumentUseCase,
      :description => "MyText",
      :name => "Name",
      :use_case_id => 1,
      :url_path => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
