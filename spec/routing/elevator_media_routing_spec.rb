require "rails_helper"

RSpec.describe ElevatorMediaController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/elevator_media").to route_to("elevator_media#index")
    end

    it "routes to #new" do
      expect(get: "/elevator_media/new").to route_to("elevator_media#new")
    end

    it "routes to #show" do
      expect(get: "/elevator_media/1").to route_to("elevator_media#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/elevator_media/1/edit").to route_to("elevator_media#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/elevator_media").to route_to("elevator_media#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/elevator_media/1").to route_to("elevator_media#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/elevator_media/1").to route_to("elevator_media#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/elevator_media/1").to route_to("elevator_media#destroy", id: "1")
    end
  end
end
