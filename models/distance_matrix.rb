require 'http'

class DistanceMatrix
 def initialize
  @api_key = ENV['API_KEY']
  @url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins="
 end

 def calculateDistance(origin, destination)
  joinedUrl = @url+"#{origin}&destinations=#{destination}&key=#{@api_key}"
  json_results = HTTP.get(joinedUrl)
  results = JSON.parse(json_results)
  distance = results['rows'][0]['elements'][0]['distance']['text']
  return distance
 end

 def calculateDuration(origin, destination)
  joinedUrl = @url+"#{origin}&destinations=#{destination}&key=#{@api_key}"
  json_results = HTTP.get(joinedUrl)
  results = JSON.parse(json_results)
  duration = results['rows'][0]['elements'][0]['duration']['text']
  return duration
 end

 def calculateDistanceAndDuration(origin, destination)
  distance = self.calculateDistance(origin, destination)
  duration = self.calculateDuration(origin, destination)
  return [distance, duration]
 end
end
