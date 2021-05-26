module Buildium
  class BuildiumResult
    attr_reader :data

    def initialize(http_response)
      @data = JSON.parse(http_response.body, symbolize_names: true).to_snake_keys
    end
  end
end
