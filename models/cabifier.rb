class Cabifier
  attr_accessor :api_key, :location
  include Enumerable

  def initialize
      @api_key = ENV['API_KEY']
      @distanceMatrix = DistanceMatrix.new
      @geocoder = Geocoder.new
      @cab
  end

  def getCabs
   json_results = HTTP.get("http://localhost:3000/cabs")
   results = JSON.parse(json_results)
   cabs = results.map { |rd| Cab.new(rd['state'], rd['name'], rd['location'], rd['city']) }
   return cabs
  end

  def getCabsInCity(city)
   if(HTTP.get("http://localhost:3000/cabs?city=#{city}").code == 200)
    json_results = HTTP.get("http://localhost:3000/cabs?city=#{city}")
    puts json_results
    results = JSON.parse(json_results)
    puts results
    cabs = results.map { |rd| Cab.new(rd['state'], rd['name'], rd['location'], rd['city']) }
    return cabs
   else
    return 'None'
   end
  end

  def cabify(address)
   clientCoords = @geocoder.geocode(address)
   clientCity = @geocoder.city(address)
   cabs = self.getCabsInCity(clientCity)

   if(cabs != 'None')
     cab = self.calculateNearestCab(cabs,clientCoords)
     puts address
     puts cab.city
     puts cab.name
     hire = HTTP.post("http://35.204.38.8:4000/api/v1/taxis/#{cab.city}/#{cab.name}", :json => {:state => "hired"})
     puts hire
      if (hire.code == 200)
       return "Success"
      else
       return "Failure"
      end
    else
     return "Failure"
   end
  end


# This method needs to be changed, using binary search instead of
# looping through every object in JSON, narrowing down to the city
# would be a better approach
  def calculateNearestCab(cabs, destination)
   cabsWithDistances = []
   for cab in cabs

    cabCoords = cab.getCoords

    cabDistance = @distanceMatrix.calculateDistance(cabCoords,destination)

    cabsWithDistances.push({cab: cab, distance: cabDistance.to_f})
   end

   results = cabsWithDistances.sort_by { |hsh| hsh[:distance] }
   return results[0][:cab]
  end
end
