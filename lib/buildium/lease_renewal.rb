module Buildium
  class LeaseRenewal < Buildium::Base
    def self.path
      'leases/{lease_id}/renewals'
    end
  end
end
