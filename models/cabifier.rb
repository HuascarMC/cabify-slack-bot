class Cabifier
  attr_accessor :api_key, :location

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

  def hiresNearestCab(address)
   cabs = self.getCabs

   clientCoords = @geocoder.geocode(address)

   @distanceMatrix.calculateNearestCab(clientCoords, cabs)


  end

  def calculateNearestCab(cabs, destination)
   cabDistances = []

   for cab in cabs
    cabCoords = cab.getCoords
    puts cabCoords
    cabDistance = @distanceMatrix.calculateDistance(cabCoords, destination)
    cabDistances.push(cabDistance)
   end

   results = cabDistances.sort!
   return results[0]
  end
end
