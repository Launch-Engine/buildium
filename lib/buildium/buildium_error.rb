module Buildium
  class BuildiumError
    attr_reader :error
    attr_reader :errors
    attr_reader :error_code
    attr_reader :response_code

    def initialize(http_response)
      data = JSON.parse(http_response.body, symbolize_names: true).to_snake_keys
      @error = data[:user_message]
      @errors = data[:errors]
      @error_message = data[:error_code]
      @response_code = http_response.response_code
    end
  end
end
