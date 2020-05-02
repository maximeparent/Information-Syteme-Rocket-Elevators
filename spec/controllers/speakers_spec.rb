require "rails_helper"
require "spec_helper"
require "json"

RSpec.describe SpeakersController, type: :controller do
    describe ".getProfiles" do
        context "Testing profile creation for SpeakerRecognition" do
            it "returns each profile" do
                uri = URI('https://elevatorrecognition.cognitiveservices.azure.com/spid/v1.0/identificationProfiles')
                uri.query = URI.encode_www_form({
                })
                request = Net::HTTP::Get.new(uri.request_uri)
                request['Ocp-Apim-Subscription-Key'] = "2b9cb2c1a1e7424a9034683b34eacd7c"
                request.body = "{body}"
                response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
                    http.request(request)
                end
                json = JSON.parse(response.body)
                puts "============ Number of profiles created =================="
                puts "The SpeakerRecognition API contains #{json.size} profiles"
                puts "========================================================="
                expect(json.size).to be_positive
            end
        end
    end

    describe ".getOperationStatus" do
        context "Testing Operation Status GET request" do
            it "returns Mykee enrollment status" do
                uri = URI('https://elevatorrecognition.cognitiveservices.azure.com/spid/v1.0/operations/2c607a1b-f1de-46cc-82f6-64b63c0dd21c')
                uri.query = URI.encode_www_form({
                })
                request = Net::HTTP::Get.new(uri.request_uri)
                request['Ocp-Apim-Subscription-Key'] = "2b9cb2c1a1e7424a9034683b34eacd7c"
                request.body = "{body}"
                response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
                    http.request(request)
                end
                json = JSON.parse(response.body)
                puts ""
                puts "============== Mykee Enrollment Status =================="
                puts json
                puts "========================================================="
                expect(json).to include("status")
            end
        end
        context "Testing Operation Status GET request" do
            it "returns conversation 3 status" do
                uri = URI('https://elevatorrecognition.cognitiveservices.azure.com/spid/v1.0/operations/e204b1a2-e7bc-480f-8688-c063d268dfa5')
                uri.query = URI.encode_www_form({
                })
                request = Net::HTTP::Get.new(uri.request_uri)
                request['Ocp-Apim-Subscription-Key'] = "2b9cb2c1a1e7424a9034683b34eacd7c"
                request.body = "{body}"
                response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
                    http.request(request)
                end
                json = JSON.parse(response.body)
                puts ""
                puts "============== Conversation 3 Status =================="
                puts "Identified speaker is: Mykee"
                puts ""
                puts json
                puts "========================================================="
                expect(json).to include("status")
            end
        end
    end

end