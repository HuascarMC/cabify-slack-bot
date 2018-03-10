require 'http'

class Geocoder
  attr_accessor :state, :name, :location, :city

  def initialize(api_key)
      @api_key = ENV[api_key]
      @location
  end
end

def geocode(address)
 @location = HTTP.get(`https://maps.googleapis.com/maps/api/geocode/json?address=` + address + '&key=' + @api_key)
end
