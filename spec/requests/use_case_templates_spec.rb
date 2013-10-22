require 'spec_helper'

describe "UseCaseTemplates" do
  describe "GET /use_case_templates" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get use_case_templates_path
      response.status.should be(200)
    end
  end
end
