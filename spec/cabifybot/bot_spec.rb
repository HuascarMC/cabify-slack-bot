require 'spec_helper'

describe CabifyBot::Bot do
  def app
    CabifyBot::Bot.instance
  end

  subject { app }

  it_behaves_like 'a slack ruby bot'
end
