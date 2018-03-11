class Cabifier
  attr_accessor :api_key, :location
  include Enumerable

  def initialize
      @api_key = ENV['API_KEY']
      @geocoder = Geocoder.new
      @distanceMatrix = DistanceMatrix.new
      @cab
  end

  def getCabs
   json_results = HTTP.get("http://localhost:3000/cabs")
   results = JSON.parse(json_results)
   cabs = results.map { |rd| Cab.new(rd['state'], rd['name'], rd['location'], rd['city']) }
   return cabs
  end

  def getCabsInCity(city)
   json_results = HTTP.get("http://localhost:3000/cabs?city=#{city}")
   results = JSON.parse(json_results)
   cabs = results.map { |rd| Cab.new(rd['state'], rd['name'], rd['location'], rd['city']) }
   puts cabs
  end

  def cabify(address)
   cabs = self.getCabs

   clientCoords = @geocoder.geocode(address)

   cab = self.calculateNearestCab(cabs, clientCoords)

   # hire = HTTP.post("http://35.204.38.8:4000/api/v1/taxis/#{cab.city}/#{cab.name}")
   # puts hire
  end

# This method needs to be changed, using binary search instead of
# looping through every object in JSON, narrowing down to the city
# would be a better approach
  def calculateNearestCab(cabs, destination)
   cabsWithDistances = []
   for cab in cabs

    cabCoords = cab.getCoords

    cabDistance = @distanceMatrix.calculateDistance(cabCoords, destination)

    cabsWithDistances.push({cab: cab, distance: cabDistance.to_f})
   end

   results = cabsWithDistances.sort_by { |hsh| hsh[:distance] }
   return results[0][:cab]
  end
end
