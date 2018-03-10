require 'gistance'

class DistanceMatrix
 def initialize
  Gistance.configure do |c|
    c.api_key = ENV['API_KEY']
    c.units = 'imperial' # default to metric
    c.language = 'en' # default to en
    c.sensor = true # default to false
  end
 end

 def calculateDistance(origin, destination)
  results = Gistance.distance_matrix(
   origins: [origin],
   destinations: [destination]
  )
  distance = results['rows'][0]['elements'][0]['distance']['text']

  return distance
 end

 def calculateDuration(origin, destination)
  results = Gistance.distance_matrix(
   origins: [origin],
   destinations: [destination]
  )
  duration = results['rows'][0]['elements'][0]['duration']['text']
  return duration
 end

 def calculateDistanceAndDuration(origin, destination)
  distance = self.calculateDistance(origin, destination)
  duration = self.calculateDuration(origin, destination)
  return [distance, duration]
 end
end
