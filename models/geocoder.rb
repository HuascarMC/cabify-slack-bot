require 'http'
require 'json'

class Geocoder
  attr_accessor :api_key, :location

  def initialize
      @api_key = ENV['API_KEY']
      VCR.eject_cassette
      VCR.turn_off!
      WebMock.disable!
  end
end

def geocode(address)
 split_address = address.gsub(/,*\s+/,'+')
 url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{split_address}&key=#{@api_key}"

 json_data = HTTP.get(url)
 data = JSON.parse(json_data)
 lat = data['results'][0]['geometry']['location']['lat']
 lng = data['results'][0]['geometry']['location']['lng']
 return [lat, lng]
end
