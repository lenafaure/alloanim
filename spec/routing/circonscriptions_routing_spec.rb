require "rails_helper"

RSpec.describe CirconscriptionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/circonscriptions").to route_to("circonscriptions#index")
    end

    it "routes to #new" do
      expect(:get => "/circonscriptions/new").to route_to("circonscriptions#new")
    end

    it "routes to #show" do
      expect(:get => "/circonscriptions/1").to route_to("circonscriptions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/circonscriptions/1/edit").to route_to("circonscriptions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/circonscriptions").to route_to("circonscriptions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/circonscriptions/1").to route_to("circonscriptions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/circonscriptions/1").to route_to("circonscriptions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/circonscriptions/1").to route_to("circonscriptions#destroy", :id => "1")
    end

  end
end
