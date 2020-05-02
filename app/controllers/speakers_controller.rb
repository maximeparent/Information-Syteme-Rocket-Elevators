class SpeakersController < ApplicationController
    before_action :authenticate_employee!

    require 'net/http'
    require 'json'
    
    def index
    end
    
    @subscriptionKey = '2b9cb2c1a1e7424a9034683b34eacd7c'
    @endpoint = "https://elevatorrecognition.cognitiveservices.azure.com/spid/v1.0"

    # First Step is to create the profile
    # Will return an Identification Id to Enroll
    def createProfile
        uri = URI('https://elevatorrecognition.cognitiveservices.azure.com/spid/v1.0/identificationProfiles')
        uri.query = URI.encode_www_form({
        })
        request = Net::HTTP::Post.new(uri.request_uri)
        request['Content-Type'] = 'application/json'
        request['Ocp-Apim-Subscription-Key'] = @subscriptionKey
        request.body = '{
            "locale":"en-us"
          }'
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        @identificationProfileId = response.body['identificationProfileId']
        return @identificationProfileId
    end

    #Create an Enrollment with the Identification 
    #Profile Id provided in createProfile method.
    def createEnrollment(identificationProfileId)    
    uri = URI('https://elevatorrecognition.cognitiveservices.azure.com/spid/v1.0/identificationProfiles/' + @identificationProfileId + '/enroll')
    uri.query = URI.encode_www_form({
        'shortAudio' => '{false}'
    })
    request = Net::HTTP::Post.new(uri.request_uri)
    request['Content-Type'] = 'multipart/form-data'
    request['Ocp-Apim-Subscription-Key'] = @subscriptionKey
    request.body = "{}"
    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end
    puts response.body
    end

    def getOperationStatus(operationId)
        uri = URI('https://elevatorrecognition.cognitiveservices.azure.com/spid/v1.0/operations/' + @operationId)
        uri.query = URI.encode_www_form({
        })
        request = Net::HTTP::Get.new(uri.request_uri)
        request['Ocp-Apim-Subscription-Key'] = @subscriptionKey
        request.body = "{}"
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        puts response.body
    end

    def identification
        return 'hello'
    end

end



    # def upload
    #     # code to upload the audio file
    # end 
    
    # def display
    #     # code to diplay the text
    # end 
  
