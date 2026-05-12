module Buildium
  class BankAccountWithdrawal < Buildium::Base
    def self.path
      'bankaccounts/{bank_account_id}/withdrawals'
    end
  end
end
