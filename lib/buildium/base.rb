module Buildium
  class Base
    SUCCESS_CODES = [200, 201].freeze

    class << self
      # -------- Action Methods --------
      def create(params)
      end

      def find(id, params = {})
        response = process_request(:get, [path, id].join('/'), params)
        return Buildium::BuildiumResult.new(response) if SUCCESS_CODES.include?(response.response_code)

        Buildium::BuildiumError.new(response)
      end

      def list(params = {})
        response = process_request(:get, path, params)
        return Buildium::BuildiumResultSet.new(response) if SUCCESS_CODES.include?(response.response_code)

        Buildium::BuildiumError.new(response)
      end

      def update(params)
      end

      # -------- Process Methods --------

      def extract_auth(params)
        {
          buildium_client_id: params&.delete(:buildium_client_id) || Buildium.configuration&.client_id,
          buildium_client_secret: params&.delete(:buildium_client_secret)  || Buildium.configuration&.client_secret,
          buildium_env: params&.delete(:buildium_env) || Buildium.configuration&.buildium_env,
        }
      end

      def process_request(request_type, url_path, params)
        auth = extract_auth(params)

        @data = Typhoeus::Request.new(
          "https://#{auth[:buildium_env]}.buildium.com/v1/#{url_path}",
          method: request_type,
          params: params,
          headers: {
            'x-buildium-client-id': auth[:buildium_client_id],
            'x-buildium-client-secret': auth[:buildium_client_secret]
          }
        ).run
      end
    end
  end
end
