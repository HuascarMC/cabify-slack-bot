module CabifyBot
  module Commands
    class Cabify < SlackRubyBot::Commands::Base
      command 'cabify' do |client, data, _match|
        client.say(channel: data.channel, text: data.text)
      end
    end
  end
end
