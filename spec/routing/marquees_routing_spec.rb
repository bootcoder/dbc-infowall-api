require "rails_helper"

RSpec.describe MarqueesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/marquees").to route_to("marquees#index")
    end

    it "routes to #new" do
      expect(:get => "/marquees/new").to route_to("marquees#new")
    end

    it "routes to #show" do
      expect(:get => "/marquees/1").to route_to("marquees#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/marquees/1/edit").to route_to("marquees#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/marquees").to route_to("marquees#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/marquees/1").to route_to("marquees#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/marquees/1").to route_to("marquees#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/marquees/1").to route_to("marquees#destroy", :id => "1")
    end

  end
end
