require "spec_helper"

describe UseCaseGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/use_case_groups").should route_to("use_case_groups#index")
    end

    it "routes to #new" do
      get("/use_case_groups/new").should route_to("use_case_groups#new")
    end

    it "routes to #show" do
      get("/use_case_groups/1").should route_to("use_case_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/use_case_groups/1/edit").should route_to("use_case_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/use_case_groups").should route_to("use_case_groups#create")
    end

    it "routes to #update" do
      put("/use_case_groups/1").should route_to("use_case_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/use_case_groups/1").should route_to("use_case_groups#destroy", :id => "1")
    end

  end
end
