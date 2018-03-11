class Cabifier
  attr_accessor :api_key, :location

  def initialize
      @api_key = ENV['API_KEY']
      @geocoder = Geocoder.new
      @distanceMatrix = DistanceMatrix.new
      @cab
  end

  def getCabs
   json_results = HTTP.get("http://35.204.38.8:4000/api/v1/taxis/")
   results = JSON.parse(json_results)
   cabs = results.map { |rd| Cab.new(rd['state'], rd['name'], rd['coords'], rd['city']) }
   return cabs
  end

  def hiresNearestCab(address)
   cabs = self.getCabs

   clientCoords = @geocoder.geocode(address)

   @distanceMatrix.calculateNearestCab(clientCoords, cabs)


  end
end
