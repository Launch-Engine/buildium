require 'pry-byebug'
require 'json'
require 'typhoeus'
require 'plissken'
require './lib/buildium-ruby'

Buildium.configure do |config|
  config.client_id = ENV['BUILDIUM_CLIENT_ID']
  config.client_secret = ENV['BUILDIUM_CLIENT_SECRET']
  config.production = true
end

# properties = Buildium::RentalProperty.list
# owners = Buildium::Owner.list(limit: 3)
owner = Buildium::Owner.find(33673)

binding.pry

adf=3