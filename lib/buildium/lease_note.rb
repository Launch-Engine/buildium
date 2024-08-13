module Buildium
  class LeaseNote < Buildium::Base
    def self.path
      'leases/{lease_id}/notes'
    end
  end
end
