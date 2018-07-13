require "rails_helper"

RSpec.describe UserHasGroupsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_has_groups").to route_to("user_has_groups#index")
    end


    it "routes to #show" do
      expect(:get => "/user_has_groups/1").to route_to("user_has_groups#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/user_has_groups").to route_to("user_has_groups#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_has_groups/1").to route_to("user_has_groups#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_has_groups/1").to route_to("user_has_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_has_groups/1").to route_to("user_has_groups#destroy", :id => "1")
    end

  end
end
