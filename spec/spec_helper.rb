$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))

require 'dotenv'
Dotenv.load('.env')
require 'slack-ruby-bot/rspec'
require 'cabify-bot/bot'
require 'cabify-bot/commands/cabify'
require 'models/cab'
require 'models/geocoder'
require 'models/distance_matrix'
require 'models/cabifier'
