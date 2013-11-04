require "spec_helper"

describe DocumentUseCasesController do
  describe "routing" do

    it "routes to #index" do
      get("/document_use_cases").should route_to("document_use_cases#index")
    end

    it "routes to #new" do
      get("/document_use_cases/new").should route_to("document_use_cases#new")
    end

    it "routes to #show" do
      get("/document_use_cases/1").should route_to("document_use_cases#show", :id => "1")
    end

    it "routes to #edit" do
      get("/document_use_cases/1/edit").should route_to("document_use_cases#edit", :id => "1")
    end

    it "routes to #create" do
      post("/document_use_cases").should route_to("document_use_cases#create")
    end

    it "routes to #update" do
      put("/document_use_cases/1").should route_to("document_use_cases#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/document_use_cases/1").should route_to("document_use_cases#destroy", :id => "1")
    end

  end
end
