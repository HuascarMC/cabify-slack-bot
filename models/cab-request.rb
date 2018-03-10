require 'json'
require 'http'
require_relative './cab'

json_cabs = HTTP.get("http://35.204.38.8:4000/api/v1/taxis/")

cabs = JSON.parse(json_cabs)

cabs = cabs.map { |rd| Cab.new(rd['state'], rd['name'], rd['coords'], rd['city']) }
puts cabs
