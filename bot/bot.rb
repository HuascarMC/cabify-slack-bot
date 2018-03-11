require 'models/cabifier'
require 'models/geocoder'
require 'models/distance_matrix'

module CabifyBot
 $cabifier = Cabifier.new
  class Bot < SlackRubyBot::Bot
   match(/^Cabify (?<expression>.*)$/) do |client, data, match|
         expression = match['expression'].strip
      response = $cabifier.cabify(expression)

      client.say(channel: data.channel, text: "A cab has been ordered to #{expression} #{response}")
   end
  end
end
