require "spec_helper"

describe UseCaseTemplatesController do
  describe "routing" do

    it "routes to #index" do
      get("/use_case_templates").should route_to("use_case_templates#index")
    end

    it "routes to #new" do
      get("/use_case_templates/new").should route_to("use_case_templates#new")
    end

    it "routes to #show" do
      get("/use_case_templates/1").should route_to("use_case_templates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/use_case_templates/1/edit").should route_to("use_case_templates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/use_case_templates").should route_to("use_case_templates#create")
    end

    it "routes to #update" do
      put("/use_case_templates/1").should route_to("use_case_templates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/use_case_templates/1").should route_to("use_case_templates#destroy", :id => "1")
    end

  end
end
