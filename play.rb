require 'slack-ruby-bot'
require 'bot/commands/cabify'
require 'bot/bot'
require 'models/geocoder'
require 'models/distance_matrix'
require 'models/cab'

class PongBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end
end

PongBot.run
