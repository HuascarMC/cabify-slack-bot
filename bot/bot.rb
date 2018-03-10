require '../models/geocoder'
require '../models/distance'
require '../models/cab'

module CabifyBot
  class Bot < SlackRubyBot::Bot
   operator '=' do |client, data, match|
     client.say(channel: data.channel, text: data)
   end
  end
end
