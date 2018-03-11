require 'models/cabifier'
require 'models/geocoder'
require 'models/distance_matrix'

module CabifyBot
  class Bot < SlackRubyBot::Bot
   match(/^Cabify (?<expression>.*)$/) do |client, data, match|
         expression = match['expression'].strip
         @cabifier = Cabifier.new
      response = @cabifier.cabify(expression)

      if (response[0] == "Success")
       client.say(channel: data.channel, text: "A cab has been ordered to #{expression}, it's name is #{response[1]} and it'll pick you up in around #{response[2]}")
      else
       client.say(channel: data.channel, text: "A cab couldnt be ordered to this address.")
      end
   end
  end
end
