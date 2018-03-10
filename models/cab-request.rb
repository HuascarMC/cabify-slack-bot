require 'json'
require 'http'
require_relative './cab'

# json_cabs = HTTP.get("http://35.204.38.8:4000/api/v1/taxis/")

# cabs = JSON.parse(json_cabs)

# cabs = cabs.map { |rd| Cab.new(rd['state'], rd['name'], rd['coords'], rd['city']) }
# puts cabs

api_key = ENV['API_KEY']
origin = '40.4153,-3.6845'
destination = '40.4489254,-3.6708406'

url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{origin}&destinations=#{destination}&key=#{api_key}"
puts url
json_distance = HTTP.get(url)
puts json_distance
