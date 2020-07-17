module LinkedinV2
  module Helpers
    module Handler
      def request(method, endpoint, params = {}, additional_headers = {}, api = API_URL, content_type = "application/json")
        attrs = [ params, additional_headers ].reject{|h| h.empty? if h.is_a?(::Hash) }

        JSON.parse(conn(api, content_type)[endpoint].public_send(method, *attrs))
      rescue RestClient::ExceptionWithResponse => exception
        raise LinkedinResponseError.new("response error", details: exception.response)
      end

      def conn(api, content_type)
        RestClient::Resource.new(api, headers: headers.merge(
          "Content-Type": content_type,
        ))
      end

      def headers
        { "Authorization": "Bearer #{token}" }
      end

      def post_headers
        { "X-Restli-Protocol-Version": "2.0.0" }
      end
    end
  end
end
