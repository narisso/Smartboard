require "spec_helper"

describe TaskUsersController do
  describe "routing" do

    it "routes to #index" do
      get("/task_users").should route_to("task_users#index")
    end

    it "routes to #new" do
      get("/task_users/new").should route_to("task_users#new")
    end

    it "routes to #show" do
      get("/task_users/1").should route_to("task_users#show", :id => "1")
    end

    it "routes to #edit" do
      get("/task_users/1/edit").should route_to("task_users#edit", :id => "1")
    end

    it "routes to #create" do
      post("/task_users").should route_to("task_users#create")
    end

    it "routes to #update" do
      put("/task_users/1").should route_to("task_users#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/task_users/1").should route_to("task_users#destroy", :id => "1")
    end

  end
end
