require "spec_helper"

describe DocumentRequirementsController do
  describe "routing" do

    it "routes to #index" do
      get("/document_requirements").should route_to("document_requirements#index")
    end

    it "routes to #new" do
      get("/document_requirements/new").should route_to("document_requirements#new")
    end

    it "routes to #show" do
      get("/document_requirements/1").should route_to("document_requirements#show", :id => "1")
    end

    it "routes to #edit" do
      get("/document_requirements/1/edit").should route_to("document_requirements#edit", :id => "1")
    end

    it "routes to #create" do
      post("/document_requirements").should route_to("document_requirements#create")
    end

    it "routes to #update" do
      put("/document_requirements/1").should route_to("document_requirements#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/document_requirements/1").should route_to("document_requirements#destroy", :id => "1")
    end

  end
end
