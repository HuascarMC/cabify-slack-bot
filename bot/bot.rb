require 'models/cabifier'
require 'models/geocoder'
require 'models/distance_matrix'

module CabifyBot
  class Bot < SlackRubyBot::Bot
   match(/^Cabify (?<expression>.*)$/) do |client, data, match|
         expression = match['expression'].strip
         @cabifier = Cabifier.new
      response = @cabifier.cabify(expression)

      client.say(channel: data.channel, text: "A cab has been ordered to #{expression} #{response}")
   end
  end
end
