require 'models/geocoder'
require 'models/distance_matrix'
require 'models/cab'

module CabifyBot
  class Bot < SlackRubyBot::Bot
   match /^Cabify (?<team>\w*)$/ do |client, data, match|
    
      client.say(channel: data.channel, text: "A cab has been ordered to #{match[:team]}")
   end
  end
end
