module Buildium
  class BuildiumError < StandardError
    attr_reader :error
    attr_reader :errors
    attr_reader :error_code
    attr_reader :response_code

    def initialize(http_response)
      data = parse_response(http_response)
      @error = data[:user_message]
      @errors = data[:errors]
      @error_code = data[:error_code]
      @response_code = http_response.response_code
      super(build_message)
    end

    # Combines the top-line user_message with any field-level errors returned
    # by Buildium so consumers see actionable detail when they `raise` or log
    # the exception. Buildium validation responses look like:
    #
    #   { "UserMessage": "The request failed validation...",
    #     "Errors": [{ "Message": "FirstName is required" }, ...] }
    def build_message
      details = Array(@errors).flat_map { |e| extract_error_text(e) }.reject { |s| s.nil? || s.empty? }
      return @error.to_s if details.empty?

      "#{@error} (#{details.join('; ')})"
    end

    def message
      build_message
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

    private

    def extract_error_text(err)
      case err
      when Hash
        # Buildium typically returns [{ message: "..." }] but be defensive
        # in case the shape changes or includes a field name.
        if err[:message]
          [err[:field], err[:message]].compact.reject(&:empty?).join(': ')
        else
          err.values.compact.map(&:to_s).reject(&:empty?).join(': ')
        end
      else
        err.to_s
      end
    end
  end
end
