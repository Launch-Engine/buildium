require 'pry-byebug'
require 'json'
require 'typhoeus'
require 'plissken'
require './lib/buildium'

Buildium.configure do |config|
  config.client_id = ENV['BUILDIUM_CLIENT_ID']
  config.client_secret = ENV['BUILDIUM_CLIENT_SECRET']
  config.production = true # ENV['BUILDIUM_PRODUCTION_MODE']
end

# properties = Buildium::RentalProperty.list
# owners = Buildium::Owner.list(limit: 3)
# owner = Buildium::Owner.find(33673)

# accounts = Buildium::GeneralLedgerAccount.list(limit: 1000)

# properties = Buildium::RentalProperty.list(limit: 5)
# transactions = Buildium::GeneralLedgerTransaction.list(startdate: '2021-01-01', enddate: '2021-06-11', glaccountids: 11)
# property_units = Buildium::RentalPropertyUnit.list(limit: 1000, propertyids: '9115,9116')

# leases = Buildium::Lease.list(limit: 5, propertyids: '140421')
# leases_balances = Buildium::LeaseBalances.list(leaseids: '507843')
leases_balances = Buildium::LeaseBalance.list(leaseids: '507843') # .data.first[:total_balance]

# balances = Buildium::Balance.list(limit: 5, entityid: 973917, entitytype: 'RentalOwner', accountingbasis: 'Cash', asofdate: '2021-08-16')

binding.pry

asdf=3