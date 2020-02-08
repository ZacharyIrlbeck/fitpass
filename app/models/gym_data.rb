class GymData
	require 'net/http' # I should add this somewhere else, no?
	# ToDo - fetch the three countries and their
	# respective data, store in cache,
	# serve!

	def initialize
        countries.each do |country|
			Rails.cache.fetch(country[:code]) do
				JSON.parse(Net::HTTP.get(URI.parse("https://api.fitpass.mx/v3/cities.json?country=#{country[:code]}")))
			end
        end
	end

	def countries
		countries = [{code: "mx", name: "Mexico"}, {code: "cl", name: "Chile"}, {code: "pe", name: "Peru"}]
	end
    
    def cities(country)
    	data = Rails.cache.fetch(country)
    end

    def zones(city_id, country)
    	Rails.cache.fetch(country).each do |city|
          return city["zones"] if city["id"] == city_id.to_i
    	end
    end
end