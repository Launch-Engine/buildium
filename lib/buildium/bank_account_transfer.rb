module Buildium
  class BankAccount < Buildium::Base
    def self.path
      'bankaccounts/{bank_account_id}/transfers'
    end
  end
end
