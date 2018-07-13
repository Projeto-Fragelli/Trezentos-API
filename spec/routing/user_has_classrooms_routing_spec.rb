require "rails_helper"

RSpec.describe UserHasClassroomsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_has_classrooms").to route_to("user_has_classrooms#index")
    end


    it "routes to #show" do
      expect(:get => "/user_has_classrooms/1").to route_to("user_has_classrooms#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/user_has_classrooms").to route_to("user_has_classrooms#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_has_classrooms/1").to route_to("user_has_classrooms#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_has_classrooms/1").to route_to("user_has_classrooms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_has_classrooms/1").to route_to("user_has_classrooms#destroy", :id => "1")
    end

  end
end
