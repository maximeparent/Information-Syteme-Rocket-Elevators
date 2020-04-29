require 'net/http'

def speechtotext
    uri = URI('https://eastus.api.cognitive.microsoft.com/speechtotext/v2.0/accuracytests')
    uri.query = URI.encode_www_form({
    })

    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = '8dcb4f30036d4abb9e6211f695d40caa'
    # Request body
    request.body = "{body}"

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end

    puts response.body
    
end