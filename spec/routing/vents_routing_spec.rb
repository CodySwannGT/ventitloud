require "spec_helper"

describe VentsController do
  describe "routing" do

    it "routes to #index" do
      get("/vents").should route_to("vents#index")
    end

    it "routes to #new" do
      get("/vents/new").should route_to("vents#new")
    end

    it "routes to #show" do
      get("/vents/1").should route_to("vents#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vents/1/edit").should route_to("vents#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vents").should route_to("vents#create")
    end

    it "routes to #update" do
      put("/vents/1").should route_to("vents#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vents/1").should route_to("vents#destroy", :id => "1")
    end

  end
end
