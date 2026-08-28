module Buildium
  class LeaseRentersInsurance < Buildium::Base
    def self.path
      'leases/{lease_id}/rentersinsurance'
    end
  end
end
