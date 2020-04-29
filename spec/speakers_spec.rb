require "rails_helper"
require "spec_helper"
require "speakers_controller"

RSpec.describe SpeakersController, type: :controller do
    describe ".enrollment" do 
        context "testing the enrollment method" do
            it "returns welcome" do
                expect(SpeakersController.enrollment).to eq('welcome')
            end
        end
    end
    describe ".identification" do
        context "testing the identification method" do
            it "returns hello" do
                expect(SpeakersController.identification).to eq('hello')
            end
        end
    end
end