require 'spec_helper'

describe CabifyBot::Bot do
  def app
    CabifyBot::Bot.instance
  end

  subject { app }

  it_behaves_like 'a slack ruby bot'

  it 'receives address' do
   expect(message: "#{SlackRubyBot.config.user} cabify Calle de Pradillo, 42, 28002 Madrid, Spain", channel: 'channel').to respond_with_slack_message('A cab has been ordered to this address')
  end

  it 'geocodes address' do
   expect([40.4489254, -3.6708406])
  end

  it 'calculates distance for the nearest taxi available' do
  end

  it 'hires the taxi' do
   
  end
end
