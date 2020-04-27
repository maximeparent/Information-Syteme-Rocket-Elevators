require 'http'
require 'json'

module ElevatorMedia
    class Streamer
        def intialize
        end
        
        def self.getContent
            uselessfact = HTTP.get("https://api.streamable.com/oembed.json?url=https://streamable.com/6llbh5")
            obj = JSON.parse(uselessfact)['html'].to_s
            media = "<div class='container-fluid video'> #{obj.to_s} </div>"
            #puts media
			#return media
        end
    end
end



