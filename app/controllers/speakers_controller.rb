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
    
    @subscriptionKey = '2b9cb2c1a1e7424a9034683b34eacd7c'
    @endpoint = "https://elevatorrecognition.cognitiveservices.azure.com/spid/v1.0"


    def upload

        p "test controller"
        puts params[:speakers]
       
        file_name = params[:audiorecord]
      puts "File name : "+file_name
      puts "Key: "+'{2b9cb2c1a1e7424a9034683b34eacd7c}' #ENV["HIDDEN"]
      fileBinary = getBinary(file_name)

        if(!fileBinary.nil?)
            p "Creating the indentification profile ..."
            
            identificationProfileIds = createProfile()
            puts identificationProfileIds
            idsList = JSON.parse(identificationProfileIds)
            puts "this the list of ids"
            puts idsList
            puts idsList["identificationProfileId"]
            
            idProfil = idsList["identificationProfileId"]
           
            p "Creating the profile  enrolement..."
            
            http_url = 'https://elevatorrecognition.cognitiveservices.azure.com/spid/v1.0/identificationProfiles/'+idProfil.to_s+'/enroll'
            puts "creating enrollement: "+http_url
            uri = URI(http_url)
            uri.query = URI.encode_www_form({ 'shortAudio' => 'true' })

            request = Net::HTTP::Post.new(uri.request_uri)
            # Request headers
            request['Content-Type'] = 'application/octet-stream'
            #request['Content-Type'] = 'application/json'
            # Request headers
            request['Ocp-Apim-Subscription-Key'] = '2b9cb2c1a1e7424a9034683b34eacd7c'  # to be hidden
            # Request body
            request.body = fileBinary

            response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
                http.request(request)
            end
            puts "not null"
            puts response.body

        end


    end 
    # mine: https://rocketelvatorsspeakerrecognition.cognitiveservices.azure.com/spid/v1.0
    # create a speaker profile
    def createProfile
            p "Creating the speaker profile ..."
            p "Key:"+'{2b9cb2c1a1e7424a9034683b34eacd7c}'
            uri = URI('https://elevatorrecognition.cognitiveservices.azure.com/spid/v1.0/identificationProfiles')
    
        uri.query = URI.encode_www_form({
        })

        request = Net::HTTP::Post.new(uri.request_uri)
        request['Content-Type'] = 'application/json'

        # Request headers
        request['Ocp-Apim-Subscription-Key'] = '2b9cb2c1a1e7424a9034683b34eacd7c' # to be hidden
        # Request body
        request.body = "{ \"locale\":\"en-us\"}"

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end

        response.body
    end

  
    # create the binaryfile
    def getBinary(path="")

        p Rails.root
        filePath = File.expand_path('azure_conversation_analysis/'+path)
        puts " In getBinary: here it is => "
        puts filePath
        if(File.exists?(filePath))
            puts "File path added "
            # close before sending
            return File.binread(filePath)
        end
        

    end

    def getIdProfils(idsList) 
            speakersIds = []
            p "retrieve ids"
            idsList.each do |foo, id|
                foo.each do |foo,id|
                    if(foo == "identificationProfileId")
                        speakersIds.push(id)
                    end
                end
            end
        
            p "a profil id is created"
            #concatenate with a ","
            puts speakersIds.join(",")
            return speakersIds.join(",")
    end
     

    
    # def self.createProfile
    #     uri = URI('https://elevatorrecognition.cognitiveservices.azure.com/spid/v1.0/identificationProfiles')
    #     uri.query = URI.encode_www_form({
    #     })

    #     request = Net::HTTP::Post.new(uri.request_uri)
    #     # Request headers
    #     request['Content-Type'] = 'application/json'
    #     # Request headers 
    #     request['Ocp-Apim-Subscription-Key'] = '{2b9cb2c1a1e7424a9034683b34eacd7c}' # to be hidden
    #     # Request body
    #     request.body = '{
    #         "locale":"en-us",
    #       }'

    #     response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
    #         http.request(request)
    #     end
    #     puts response.body
    #     idenjson = JSON.parse(response.body)
        
    #     identificationProfileId = idenjson['identificationProfileId']
    #     p identificationProfileId
    #     return identificationProfileId

       
    # end

    # save the identidication id and create a profil

    # def save
    #     identificationProfileId =  self.createProfile
    #     p "profile will be created"
    #     audiorecordfile = File.read(params[:audiorecordID].path)
    #     uri = URI('https://elevatorrecognition.cognitiveservices.azure.com/spid/v1.0/identificationProfiles')


        
    # end 

    

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


