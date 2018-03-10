require 'http'

class Geocoder
  attr_accessor :api_key, :location

  def initialize
      @api_key = ENV['API_KEY']
  end
end

def getapi_key
 return @api_key
end

def geocode(address)
 split_address = address.gsub(/,*\s+/,'+')
 url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{split_address}&key=#{@api_key}"
 puts url
 json_data = HTTP.get(url)
 puts 'lol'
 puts json_data

 # return json_data
end
