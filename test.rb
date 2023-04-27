require 'pry-byebug'
require 'json'
require 'typhoeus'
require 'plissken'
require './lib/buildium'

# Buildium.configure do |config|
#   config.client_id = ENV['BUILDIUM_CLIENT_ID']
#   config.client_secret = ENV['BUILDIUM_CLIENT_SECRET']
#   config.production = true # ENV['BUILDIUM_PRODUCTION_MODE']
# end

auth = {
  buildium_client_id: ENV['BUILDIUM_CLIENT_ID'],
  buildium_client_secret: ENV['BUILDIUM_CLIENT_SECRET'],
  buildium_env: 'api' # 'api' or 'apisandbox'
}

# properties = Buildium::RentalProperty.list
# owners = Buildium::Owner.list(limit: 3)
# owner = Buildium::Owner.find(1154939, auth)

# accounts = Buildium::GeneralLedgerAccount.list(limit: 1000)

# properties = Buildium::RentalProperty.list(limit: 5)
# transactions = Buildium::GeneralLedgerTransaction.list(startdate: '2021-01-01', enddate: '2021-06-11', glaccountids: 11)
# property_units = Buildium::RentalPropertyUnit.list(limit: 1000, propertyids: '153225')

# leases = Buildium::Lease.list(auth.merge(limit: 5, propertyids: '140421'))
# leases_balances = Buildium::LeaseBalances.list(leaseids: '507843')
# leases_balances = Buildium::LeaseBalance.list(leaseids: '507843') # .data.first[:total_balance]

balances = Buildium::Balance.list(auth.merge(entityid: 1154939, entitytype: 'RentalOwner', accountingbasis: 'Accrual', asofdate: '2023-04-18'))
binding.pry

# balances = Buildium::Balance.list(auth.merge(entityid: 33673, entitytype: 'RentalOwner', accountingbasis: 'Cash', asofdate: '2023-04-18'))


# retval = Buildium::Connection.test(auth)

# 1 Carriage House Lane
# transactions = Buildium::GeneralLedgerTransaction.list(auth.merge(selectionentityid: '151194',selectionentitytype: 'Rental', startdate: '2021-01-01', enddate: '2021-06-11', glaccountids: 11))

# association_balances = Buildium::AssociationOwnershipAccountBalance.list(auth.merge(limit: 5))

# accounts = Buildium::GeneralLedgerAccount.list(as_limit: 10)

binding.pry

asdf=3