require 'json'
require 'httpclient'
require 'net/http'
​​
    YOUR_AUDIO_FILE = 'scenario_6_Ukeme_Mykee_EN.wav'
    REGION = 'westus' # westus, eastasia, northeurope 
    MODE = 'interactive'
    LANG = 'en-US'
    FORMAT = 'simple'
​
    # def initialize
    # end
​
    def handler()
        # 1. Get an Authorization Token
        token = get_token()
        # 2. Perform Speech Recognition
        results = get_text(token, YOUR_AUDIO_FILE)
        # 3. Print Results
        puts results
    end
    def get_token()
        
       HTTPClient
        # Return an Authorization Token by making a HTTP POST request to Cognitive Services with a valid API key.
        url = 'https://api.cognitive.microsoft.com/sts/v1.0/issueToken'
        headers = {
            'Ocp-Apim-Subscription-Key': YOUR_API_KEY
        }
        
        token = HTTPClient.post(url, headers=headers).content
    
        return token
        end
    
​
    def get_text(token, audio)
        
        # Request that the Bing Speech API convert the audio to text
        url = 'https://westus.stt.speech.microsoft.com/speech/recognition/interactive/cognitiveservices/v1?language=en-US&format=simple'
        headers = {
            'Accept': 'application/json',
            'Ocp-Apim-Subscription-Key': YOUR_API_KEY,
            'Transfer-Encoding': 'chunked',
            'Content-type': 'audio/wav; codec=audio/pcm; samplerate=16000',
            'Authorization': 'Bearer'"#{token}"
        }
​
    results = JSON.parse([HTTPClient.post(url, headers=headers, data=stream_audio_file(audio)).content].to_json).first['html'].to_s
        puts results.to_s
        end
    
​
    def stream_audio_file(speech_file, chunk_size=1024)
        # Chunk audio file
        # with open(speech_file, 'rb') as f:
        
            data = open(speech_file, 'rb').read(1024)
         
         puts data
          
            
 end
    
        handler()
