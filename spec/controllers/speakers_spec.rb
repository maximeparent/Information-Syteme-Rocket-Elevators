require "rails_helper"
require "spec_helper"

RSpec.describe SpeakersController, type: :controller do
    describe ".createProfile" do
        context "Testing Profile Creation for SpeakerRecognition" do
            it "returns an identificationProfileId" do
                uri = URI('https://elevatorrecognition.cognitiveservices.azure.com/spid/v1.0/identificationProfiles')
                uri.query = URI.encode_www_form({
                    })
                    request = Net::HTTP::Post.new(uri.request_uri)
                    request['Content-Type'] = 'application/json'
                    request['Ocp-Apim-Subscription-Key'] = '2b9cb2c1a1e7424a9034683b34eacd7c'
                    request.body = '{
                        "locale":"en-us"
                      }'
                    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
                        http.request(request)
                    end
                    puts response.body
                    expect(response.body).to include("identificationProfileId:")
            end
        end
    end

    describe ".createEnrollment" do
        context "Testing Enrollment Creation for SpeakerRecognition" do
            it "returns status 202 Accepted" do
            end
        end
    end

    describe ".identification" do
        context "Testing Identification Creation for SpeakerRecognition" do
            it "returns status 202 Accepted" do
            end
        end
    end

    describe ".getOperationStatus" do
        context "Testing Operation Status GET request" do
            it "returns operation status" do
            end
        end
    end
end