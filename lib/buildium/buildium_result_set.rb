module Buildium
  class BuildiumResultSet
    attr_reader :data
    attr_reader :total_count

    def initialize(http_response)
      @data = JSON.parse(http_response.body, symbolize_names: true).to_snake_keys
      @total_count = http_response.headers['x-total-count'].to_i
    end
  end
end
