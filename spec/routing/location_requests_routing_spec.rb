require "spec_helper"

describe LocationRequestsController do
  describe "routing" do

    it "routes to #index" do
      get("/location_requests").should route_to("location_requests#index")
    end

    it "routes to #new" do
      get("/location_requests/new").should route_to("location_requests#new")
    end

    it "routes to #show" do
      get("/location_requests/1").should route_to("location_requests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/location_requests/1/edit").should route_to("location_requests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/location_requests").should route_to("location_requests#create")
    end

    it "routes to #update" do
      put("/location_requests/1").should route_to("location_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/location_requests/1").should route_to("location_requests#destroy", :id => "1")
    end

  end
end
