require 'spec_helper'

describe CabifyBot::Bot do
  def app
    CabifyBot::Bot.instance
  end

  subject { app }

  it_behaves_like 'a slack ruby bot'

  xit 'can hire a cab' do
   expect(message: "Cabify Calle de Pradillo, 42, 28002 Madrid, Spain", channel: 'channel').to respond_with_slack_message('A cab has been ordered to Calle de Pradillo, 42, 28002 Madrid, Spain')
  end

  xit 'fails to hire a cab' do
   expect(message: "Angola City", channel: 'channel').to respond_with_slack_message("A cab couldnt be ordered to this address.")
  end
end
