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

      def test(auth_params)
        response = process_request(:get, test_path, auth_params.merge(limit: 1))
        return true if SUCCESS_CODES.include?(response.response_code)

        Buildium::BuildiumError.new(response)
      end

      def create(json_body, params = {})
        response = process_request(:post, path, params, body: json_body.to_camel_keys)
        return Buildium::BuildiumResultSet.new(response) if SUCCESS_CODES.include?(response.response_code)

        Buildium::BuildiumError.new(response)
      end

      def update(json_body, params = {})
        response = process_request(:put, path, params, body: json_body.to_camel_keys)
        return Buildium::BuildiumResultSet.new(response) if SUCCESS_CODES.include?(response.response_code)

        Buildium::BuildiumError.new(response)
      end

      # -------- Process Methods --------

      def extract_auth(params)
        {
          buildium_client_id: params&.delete(:buildium_client_id) || Buildium.configuration&.client_id,
          buildium_client_secret: params&.delete(:buildium_client_secret)  || Buildium.configuration&.client_secret,
          buildium_env: params&.delete(:buildium_env) || Buildium.configuration&.buildium_env,
        }
      end

      def process_request(request_type, url_path, params, body: nil)
        auth = extract_auth(params)
        processed_url_path = url_path.gsub(/{(.*?)}/) { params.delete($1.to_sym) }

        @data = Typhoeus::Request.new(
          "https://#{auth[:buildium_env]}.buildium.com/v1/#{processed_url_path}",
          method: request_type,
          params: params,
          body: body&.to_json,
          headers: {
            'x-buildium-client-id': auth[:buildium_client_id],
            'x-buildium-client-secret': auth[:buildium_client_secret],
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }
        ).run
      end
    end
  end
end
