require 'slack-ruby-bot'
require 'slack-mathbot/commands/calculate'
require 'slack-mathbot/bot'

class PongBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end
end

PongBot.run
