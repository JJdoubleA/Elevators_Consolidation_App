module Elevatormedia
    
    class Streamer

        def self.getContent
           

                require 'uri'
                require 'net/http'
                require 'openssl'

                url = URI("https://world-population.p.rapidapi.com/population?country_name=Canada")

                http = Net::HTTP.new(url.host, url.port)
                http.use_ssl = true
                http.verify_mode = OpenSSL::SSL::VERIFY_NONE

                request = Net::HTTP::Get.new(url)
                
                request["x-rapidapi-key"] = '2af5a83168msha081b942dded4a2p13cd0ejsn6d1062e2aeb6'
                request["x-rapidapi-host"] = 'world-population.p.rapidapi.com'
                response = http.request(request)
                
                puts "<div>"
                #puts  response.read_body
                result = JSON.parse(response.read_body)
                puts result
                puts "</div>"
            
            
            return (
                "<div>#{result}</div>"
                
            )

            puts getContent
        end
    end
end
