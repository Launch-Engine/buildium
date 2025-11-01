# frozen_string_literal: true

require 'rubygems'

require_relative 'buildium/version'

require_relative 'buildium/buildium'

require_relative 'buildium/configuration'

require_relative 'buildium/buildium_error'
require_relative 'buildium/buildium_result'
require_relative 'buildium/buildium_result_set'

require_relative 'buildium/base'
require_relative 'buildium/applicant'
require_relative 'buildium/administration_account'
require_relative 'buildium/balance'
require_relative 'buildium/bank_account'
require_relative 'buildium/connection'
require_relative 'buildium/epay_settings'
require_relative 'buildium/general_ledger_account'
require_relative 'buildium/general_ledger_transaction'
require_relative 'buildium/lease'
require_relative 'buildium/lease_balance'
require_relative 'buildium/lease_note'
require_relative 'buildium/lease_transaction'
require_relative 'buildium/owner'
require_relative 'buildium/rental_property'
require_relative 'buildium/rental_property_unit'
require_relative 'buildium/user'
require_relative 'buildium/user_role'
require_relative 'buildium/vendor'

require_relative 'buildium/association_ownership_account_balance'

# module Buildium
#   class Error < StandardError; end
#   # Your code goes here...
# end
