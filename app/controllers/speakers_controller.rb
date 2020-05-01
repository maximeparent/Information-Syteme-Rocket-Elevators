class SpeakersController < ApplicationController
    before_action :authenticate_employee!

    require 'net/http'
    require 'json'
    require 'find'
    # require 'azure/storage/blob' # not working
    require 'uri'
    require 'openssl'
    
    def index

    end
    
    # First Step is to create the profile
    # Will return an Identification Id to Enroll
    def self.createProfile
        uri = URI('https://elevatorrecognition.cognitiveservices.azure.com/spid/v1.0/identificationProfiles')
        uri.query = URI.encode_www_form({
        })

        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'application/json'
        # Request headers 
        request['Ocp-Apim-Subscription-Key'] = '{2b9cb2c1a1e7424a9034683b34eacd7c}' # to be hidden
        # Request body
        request.body = '{
            "locale":"en-us",
          }'

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        puts response.body
        idenjson = JSON.parse(response.body)
        
        identificationProfileId = idenjson['identificationProfileId']
        p identificationProfileId
        return identificationProfileId

       
    end

    # save the identidication id and create a profil

    def save
        identificationProfileId =  self.createProfile
        p "profile will be created"
        audiorecordfile = File.read(params[:audiorecordID].path)
        uri = URI('https://elevatorrecognition.cognitiveservices.azure.com/spid/v1.0/identificationProfiles')


        
    end 

    

    #Create an Enrollment with the Identification 
    #Profile Id provided in createProfile method.
    # def self.createEnrollment(identificationProfileId)    
    # uri = URI('https://elevatorrecognition.cognitiveservices.azure.com/spid/v1.0/identificationProfiles/'@identificationProfileId + '/enroll')
    # uri.query = URI.encode_www_form({
    #     # Request parameters
    #     'shortAudio' => '{false}'
    # })
    # request = Net::HTTP::Post.new(uri.request_uri)
    # # Request headers
    # request['Content-Type'] = 'multipart/form-data'
    # # Request headers
    # request['Ocp-Apim-Subscription-Key'] = '{2b9cb2c1a1e7424a9034683b34eacd7c}'

    # # Request body ( Audio File need to be put here )
    # request.body = "{body}"

    # response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
    #     http.request(request)
    # end
    # puts response.body
    # end

    def identification
        return 'hello'
    end

    # def upload
    #     # code to upload the audio file
    # end 
    # def display
    #     # code to diplay the text
    # end 
  

end