require 'http'
class Cab
  attr_accessor :state, :name, :location, :city

  def initialize(state, name, location, city)
      @state = state
      @name = name
      @location = location
      @city = city
  end

  def getCabs
   json_results = HTTP.get("http://35.204.38.8:4000/api/v1/taxis/")
   results = JSON.parse(json_results)
   cabs = results.map { |rd| Cab.new(rd['state'], rd['name'], rd['coords'], rd['city']) }
   return cabs
  end
end
