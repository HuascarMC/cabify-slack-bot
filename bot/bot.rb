require 'models/cabifier'
require 'models/geocoder'
require 'models/distance_matrix'

module CabifyBot
  class Bot < SlackRubyBot::Bot
   match(/^Cabify (?<expression>.*)$/) do |client, data, match|
         expression = match['expression'].strip
         @cabifier = Cabifier.new
      response = @cabifier.cabify(expression)

      if (response == "Success")
       client.say(channel: data.channel, text: "A cab has been ordered to #{expression}")
      else
       client.say(channel: data.channel, text: "A cab couldnt be ordered to this address.")
      end
   end
  end
end
