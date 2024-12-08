module Buildium
  class BuildiumError
    attr_reader :error
    attr_reader :errors
    attr_reader :error_code
    attr_reader :response_code

    def initialize(http_response)
      data = parse_response(http_response)
      @error = data[:user_message]
      @errors = data[:errors]
      @error_message = data[:error_code]
      @response_code = http_response.response_code
    end

    def default_response(response)
      {
        user_message: 'Unknown response',
        errors: ['Unknown response'],
        error_code: response.response_code
      }
    end

    def not_found_response(response)
      {
        user_message: 'Resource not found',
        errors: ['Resource not found'],
        error_code: response.response_code
      }
    end

    def parse_response(response)
      return JSON.parse(response.body, symbolize_names: true).to_snake_keys unless response.body.to_s == ''
      return not_found_response(response) if response.response_code == 404

      default_response(response)
    end
  end
end
