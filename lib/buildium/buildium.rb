module Buildium
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Buildium::Configuration.new
      yield(configuration)
    end

    def reset
      self.configuration = Buildium::Configuration.new
    end
  end
end
