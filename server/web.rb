require 'sinatra/base'

module Bot
  class Web < Sinatra::Base
    get '/' do
      'Math is good for you.'
    end
  end
end
