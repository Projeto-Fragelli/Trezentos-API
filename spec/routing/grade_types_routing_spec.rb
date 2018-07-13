require "rails_helper"

RSpec.describe GradeTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/grade_types").to route_to("grade_types#index")
    end


    it "routes to #show" do
      expect(:get => "/grade_types/1").to route_to("grade_types#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/grade_types").to route_to("grade_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/grade_types/1").to route_to("grade_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/grade_types/1").to route_to("grade_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/grade_types/1").to route_to("grade_types#destroy", :id => "1")
    end

  end
end
