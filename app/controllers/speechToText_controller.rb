class SpeechToTextController < ApplicationController

require 'net/http'
require 'json'
    def Uploadfile
            uri = URI('https://westus.api.cognitive.microsoft.com/speechtotext/v2.0/transcriptions')
            uri.query = URI.encode_www_form({
            })
            request = Net::HTTP::Post.new(uri.request_uri)
            # Request headers
            request['Content-Type'] = 'application/json'
            
            request['Ocp-Apim-Subscription-Key'] = 'a2b6017aef3e4b7ba689f595ace164b1'
            # Request body
            pathName = Rails.root + 'app/assets/audio/'
            fileName = 'scenario_6_Ukeme_Mykee_EN'
            File.open("#{pathName}#{fileName}.wav") do |aFile|
            @file_data = "#{aFile.read}; samplerate=16000"
            end
            
            request.body = @file_data

            response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
                http.request(request)
            end
            speach = response.body
            obj = JSON.parse(speach)['DisplayText']
            puts obj
            text = "<div>#{obj}</div>"
            return text
    end
end