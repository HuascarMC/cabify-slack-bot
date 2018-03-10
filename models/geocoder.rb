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
 json_data = HTTP.get(`https://maps.googleapis.com/maps/api/geocode/json?address=` + address + '&key=' + @api_key)
 puts json_data
end
