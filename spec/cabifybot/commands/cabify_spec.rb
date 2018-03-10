require 'spec_helper'

describe CabifyBot::Commands::Cabify do
  def app
    CabifyBot::Bot.instance
  end

  subject { app }

  it 'replies when command triggered' do
    expect(message: "#{SlackRubyBot.config.user} cabify", channel: 'channel').to respond_with_slack_message('A cab has been ordered to this address')
  end
end
