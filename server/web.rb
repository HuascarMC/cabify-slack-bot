require 'sinatra/base'

module Bot
  class Web < Sinatra::Base
    get '/' do
      '.'
    end
  end
end
