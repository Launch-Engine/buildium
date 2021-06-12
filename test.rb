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

accounts = Buildium::GeneralLedgerAccount.list(limit: 1000)


# transactions = Buildium::GeneralLedgerTransaction.list(startdate: '2021-01-01', enddate: '2021-06-11', glaccountids: 11)

binding.pry

adf=3

# @data=
# [{:id=>41071939,
#   :date=>"2021-01-11",
#   :transaction_type=>"ElectronicFundsTransfer",
#   :total_amount=>619.25,
#   :check_number=>"",
#   :unit_agreement=>nil,
#   :unit_id=>nil,
#   :unit_number=>nil,
#   :payment_detail=>
#    {:payment_method=>"Check",
#     :payee=>{:id=>749239, :name=>"2716 Saint Edwards Circle LLC", :type=>"RentalOwner", :href=>"https://api.buildium.com/v1/rentals/owners/749239"},
#     :is_internal_transaction=>true,
#     :internal_transaction_status=>{:is_pending=>false, :result_date=>"2021-01-11", :result_code=>"S01"}},
#   :journal=>
#    {:memo=>"Owner Draw",
#     :lines=>
#      [{:gl_account=>
#         {:id=>11,
#          :name=>"Owner Draw",
#          :description=>"Owner Draw",
#          :type=>"Equity",
#          :sub_type=>"Equity",
#          :is_default_gl_account=>true,
#          :is_contra_account=>true,
#          :is_bank_account=>false,
#          :cash_flow_classification=>"FinancingActivities",
#          :exclude_from_cash_balances=>false,
#          :sub_accounts=>nil},
#        :amount=>619.25,
#        :is_cash_posting=>true,
#        :reference_number=>"",
#        :memo=>"Owner Draw",
#        :accounting_entity=>{:id=>123286, :accounting_entity_type=>"Rental", :href=>"https://api.buildium.com/v1/rentals/123286"}}]}},