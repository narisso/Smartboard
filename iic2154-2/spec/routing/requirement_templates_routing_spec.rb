require "spec_helper"

describe RequirementTemplatesController do
  describe "routing" do

    it "routes to #index" do
      get("/requirement_templates").should route_to("requirement_templates#index")
    end

    it "routes to #new" do
      get("/requirement_templates/new").should route_to("requirement_templates#new")
    end

    it "routes to #show" do
      get("/requirement_templates/1").should route_to("requirement_templates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/requirement_templates/1/edit").should route_to("requirement_templates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/requirement_templates").should route_to("requirement_templates#create")
    end

    it "routes to #update" do
      put("/requirement_templates/1").should route_to("requirement_templates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/requirement_templates/1").should route_to("requirement_templates#destroy", :id => "1")
    end

  end
end
