module Buildium
  class Base
    class << self
      def create(params)
      end

      def find(id, params = {})
        response = process_request(:get, [path, id].join('/'), params)
        return Buildium::BuildiumResult.new(response) if [200, 201].include?(response.response_code)

        Buildium::BuildiumError.new(response)
      end

      def list(params = {})
        response = process_request(:get, path, params)
        return Buildium::BuildiumResultSet.new(response) if [200, 201].include?(response.response_code)

        Buildium::BuildiumError.new(response)
      end

      def update(params)
      end

      def process_request(request_type, url_path, params)
        @data = Typhoeus::Request.new(
          "https://#{Buildium.configuration.buildium_env}.buildium.com/v1/#{url_path}",
          method: request_type,
          params: params,
          headers: {
            'x-buildium-client-id': Buildium.configuration.client_id,
            'x-buildium-client-secret': Buildium.configuration.client_secret
          }
        ).run
      end
    end
  end
end
