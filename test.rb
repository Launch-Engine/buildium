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

# auth = {
#   buildium_client_id: '1cc89101-3f9b-4d76-a48a-a4224c7025dd',
#   buildium_client_secret: 'Lv3dWHyOzeHDwxZQl70M2Qz438uhVmserLMEejvDzrs=',
#   buildium_env: 'api' # 'api' or 'apisandbox'
# }

# properties = Buildium::RentalProperty.list
# owners = Buildium::Owner.list(limit: 3)
# owner = Buildium::Owner.find(1154939, auth)

# accounts = Buildium::GeneralLedgerAccount.list(auth.merge(limit: 1000))

# vendors = Buildium::Vendor.list(auth.merge(limit: 1000))

# user_roles = Buildium::UserRole.list(auth.merge(limit: 100))

# users = Buildium::User.list(auth.merge(limit: 100))

# properties = Buildium::RentalProperty.list(limit: 5)
# transactions = Buildium::GeneralLedgerTransaction.list(startdate: '2021-01-01', enddate: '2021-06-11', glaccountids: 11)
# property_units = Buildium::RentalPropertyUnit.list(auth.merge(limit: 1000, propertyids: '21740,29079,29088,29093,29094'))

# leases = Buildium::Lease.list(auth.merge(limit: 5, propertyids: '140421'))
# leases_balances = Buildium::LeaseBalances.list(leaseids: '507843')
# leases_balances = Buildium::LeaseBalance.list(leaseids: '507843') # .data.first[:total_balance]

notes = Buildium::LeaseNote.list(auth.merge(lease_id: '507843'))

binding.pry
asdf=3

# balances = Buildium::Balance.list(auth.merge(entityid: 1154939, entitytype: 'RentalOwner', accountingbasis: 'Accrual', asofdate: '2023-04-18'))
# binding.pry

# balances = Buildium::Balance.list(auth.merge(entityid: 33673, entitytype: 'RentalOwner', accountingbasis: 'Cash', asofdate: '2023-04-18'))


# retval = Buildium::Connection.test(auth)

# 1 Carriage House Lane
# transactions = Buildium::GeneralLedgerTransaction.list(auth.merge(selectionentityid: '151194',selectionentitytype: 'Rental', startdate: '2021-01-01', enddate: '2021-06-11', glaccountids: 11))

# association_balances = Buildium::AssociationOwnershipAccountBalance.list(auth.merge(limit: 5))

# accounts = Buildium::GeneralLedgerAccount.list(as_limit: 10)


# def general_ledger_buildium_ids_to_sync
# [1,  195959,  16,  49217,  233374,  68463,  49205,  217340,  200109,  49209,  197135,  3,  2,  4,  5,  7,  201430,  8,  9,  10,  221530,  11,  18,  49202,  49206,  49214,  49215,  49220,  221524,  49222,  49230,  52748,  77360,  79427,  115758,  184464,  49210,  49211,  14,  49204,  49212,  49216,  49213,  19,  49218,  63855,  49219,  49221,  13,  15,  12,  109874,  49223,  49224,  49225,  49226,  49227,  49203,  184213,  197649,  189145,  190726,  194418,  195960,  204951,  204953,  211468,  214221,  218360,  196684,  49207,  49208,  187516,  211469,  219932,  219933,  219976,  219980,  220031,  220633,  220634,  221258,  222935,  218238,  184461,  208640,  221534,  221781,  224393,  226257,  230853,  230858,  231967,  225873,  227395,  222989,  77732,  218707,  230852,  194415,  197440,  218884,  229437,  231483,  194249,  218710,  218711,  228944,  228960,  232170,  194248,  17,  219975,  221441,  218708]
# end

# offset = 0
# loop do
#   transactions = Buildium::GeneralLedgerTransaction.list(
#     auth.merge(
#       startdate: '2023-07-17',
#       enddate: '2023-07-19',
#       limit: 100,
#       offset: offset,
#       glaccountids: general_ledger_buildium_ids_to_sync.join(',')
#     )
#   )

#   if transactions.data.size.zero?
#     break
#   end

#   transactions.data.each do |transaction|
#     binding.pry if transaction[:total_amount].to_i == 11522
#     asdf=3
#   end

#   if transactions.data.to_s.include?('Paint all walls')
#     puts 'Yes'
#   else
#     puts 'No'
#   end
#   offset += 100
# end
