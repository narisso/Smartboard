require "spec_helper"

describe DocumentProjectsController do
  describe "routing" do

    it "routes to #index" do
      get("/document_projects").should route_to("document_projects#index")
    end

    it "routes to #new" do
      get("/document_projects/new").should route_to("document_projects#new")
    end

    it "routes to #show" do
      get("/document_projects/1").should route_to("document_projects#show", :id => "1")
    end

    it "routes to #edit" do
      get("/document_projects/1/edit").should route_to("document_projects#edit", :id => "1")
    end

    it "routes to #create" do
      post("/document_projects").should route_to("document_projects#create")
    end

    it "routes to #update" do
      put("/document_projects/1").should route_to("document_projects#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/document_projects/1").should route_to("document_projects#destroy", :id => "1")
    end

  end
end
