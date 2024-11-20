module Buildium
  class EpaySettings < Buildium::Base
    def self.path
      'leases/{lease_id}/epaysettings'
    end
  end
end
