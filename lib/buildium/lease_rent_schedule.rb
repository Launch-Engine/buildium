module Buildium
  class LeaseRentSchedule < Buildium::Base
    def self.path
      'leases/{lease_id}/rent'
    end
  end
end
