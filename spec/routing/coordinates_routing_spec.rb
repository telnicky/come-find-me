require "spec_helper"

describe CoordinatesController do
  describe "routing" do

    it "routes to #index" do
      get("/coordinates").should route_to("coordinates#index")
    end

    it "routes to #new" do
      get("/coordinates/new").should route_to("coordinates#new")
    end

    it "routes to #show" do
      get("/coordinates/1").should route_to("coordinates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/coordinates/1/edit").should route_to("coordinates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/coordinates").should route_to("coordinates#create")
    end

    it "routes to #update" do
      put("/coordinates/1").should route_to("coordinates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/coordinates/1").should route_to("coordinates#destroy", :id => "1")
    end

  end
end
