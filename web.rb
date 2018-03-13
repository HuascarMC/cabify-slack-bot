require 'sinatra/base'

module CabifyBot
  class Web < Sinatra::Base
    get '/' do
      '.'
    end
  end
end
