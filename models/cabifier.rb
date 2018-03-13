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
   json_results = HTTP.get("https://cabify-json.herokuapp.com/cabs/")
   results = JSON.parse(json_results)
   cabs = results.map { |rd| Cab.new(rd['state'], rd['name'], rd['location'], rd['city']) }
   return cabs
  end

  def getCabsInCity(city)
   if(HTTP.get("https://cabify-json.herokuapp.com/cabs?city=#{city}").code == 200)
    json_results = HTTP.get("https://cabify-json.herokuapp.com/cabs?city=#{city}")
    results = JSON.parse(json_results)
    cabs = results.map { |rd| Cab.new(rd['state'], rd['name'], rd['location'], rd['city']) }
    return cabs
   else
    return []
   end
  end

  def cabify(address)
   clientCoords = @geocoder.geocode(address)
   clientCity = @geocoder.city(address)
   cabs = self.getCabsInCity(clientCity)


   if(cabs != [])
     cabAndDuration = self.calculateNearestCabAndDuration(cabs,clientCoords)

     cab = cabAndDuration[0]
     duration = cabAndDuration[1]
     hire = HTTP.post("http://35.204.38.8:4000/api/v1/taxis/#{cab.city}/#{cab.name}", :json => {:state => "hired"})

      if (hire.code == 200)
       return ["Success", cab.name, duration]
      else
       return 'failure'
      end
    else
     return "failure"
   end
  end


# This method needs to be changed, using binary search instead of
# looping through every object in JSON, narrowing down to the city
# would be a better approach
  def calculateNearestCabAndDuration(cabs, destination)
   cabsWithDistances = []
   for cab in cabs

    cabCoords = cab.getCoords

    cabDistanceAndDuration = @distanceMatrix.calculateDistanceAndDuration(cabCoords,destination)
    cabDistance = cabDistanceAndDuration[0]
    cabDuration = cabDistanceAndDuration[1]


    cabsWithDistances.push({cab: cab, distance: cabDistance.to_f})
   end

   results = cabsWithDistances.sort_by { |hsh| hsh[:distance] }
   if results != nil
    return [results[0][:cab], cabDuration]
   else
    return 'failure'
   end
  end
end
