require 'models/geocoder'
require 'models/distance_matrix'
require 'models/cab'

module CabifyBot
  class Bot < SlackRubyBot::Bot
   match /^Cabify (?<location>\w*)$/ do |client, data, match|

      destinationCoords = Geocoder.new().geocode(match[:location])
      cabs = Cab.new().getCabs
      client.say(channel: data.channel, text: "A cab has been ordered to #{match[:location]}")
   end
  end
end
