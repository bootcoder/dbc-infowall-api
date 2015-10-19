require "rails_helper"

RSpec.describe TextScrollsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/text_scrolls").to route_to("text_scrolls#index")
    end

    it "routes to #new" do
      expect(:get => "/text_scrolls/new").to route_to("text_scrolls#new")
    end

    it "routes to #show" do
      expect(:get => "/text_scrolls/1").to route_to("text_scrolls#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/text_scrolls/1/edit").to route_to("text_scrolls#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/text_scrolls").to route_to("text_scrolls#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/text_scrolls/1").to route_to("text_scrolls#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/text_scrolls/1").to route_to("text_scrolls#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/text_scrolls/1").to route_to("text_scrolls#destroy", :id => "1")
    end

  end
end
