module Buildium
  class Configuration
    attr_accessor :client_id
    attr_accessor :client_secret
    attr_accessor :production

    def initialize
      @production = false
    end

    def buildium_env
      @production ? 'api' : 'apisandbox'
    end
  end
end
