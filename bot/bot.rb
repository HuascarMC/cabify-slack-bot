

module CabifyBot
  class Bot < SlackRubyBot::Bot
   operator '=' do |client, data, match|
     client.say(channel: data.channel, text: data)
   end
  end
end
