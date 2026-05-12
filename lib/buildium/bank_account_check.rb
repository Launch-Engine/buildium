module Buildium
  class BankAccountCheck < Buildium::Base
    def self.path
      'bankaccounts/{bank_account_id}/checks'
    end
  end
end
