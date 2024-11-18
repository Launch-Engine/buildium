module Buildium
  class LeaseTransactions < Buildium::Base
    def self.path
      'leases/{lease_id}/transactions'
    end
  end
end
