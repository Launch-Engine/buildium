module Buildium
  class BankAccount < Buildium::Base
    def self.path
      'bankaccounts/{bank_account_id}/deposits'
    end
  end
end
