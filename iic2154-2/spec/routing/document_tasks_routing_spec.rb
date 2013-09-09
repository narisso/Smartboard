require "spec_helper"

describe DocumentTasksController do
  describe "routing" do

    it "routes to #index" do
      get("/document_tasks").should route_to("document_tasks#index")
    end

    it "routes to #new" do
      get("/document_tasks/new").should route_to("document_tasks#new")
    end

    it "routes to #show" do
      get("/document_tasks/1").should route_to("document_tasks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/document_tasks/1/edit").should route_to("document_tasks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/document_tasks").should route_to("document_tasks#create")
    end

    it "routes to #update" do
      put("/document_tasks/1").should route_to("document_tasks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/document_tasks/1").should route_to("document_tasks#destroy", :id => "1")
    end

  end
end
