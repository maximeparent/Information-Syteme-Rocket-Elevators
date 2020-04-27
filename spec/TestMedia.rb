require 'ElevatorMedia/ElevatorMedia.rb'

describe ElevatorMedia::Streamer, :type => :feature do
    describe "getContent" do
        context "Get a useless quote" do 
            it "return a useless quote as a string" do
                expect(ElevatorMedia::Streamer.getContent).to be_kind_of String
            end
        end
    end
end

