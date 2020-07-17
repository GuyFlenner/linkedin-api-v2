require_relative "response"

module LinkedinV2
  module Url
    class Builder
      def self.call(key, **options)
        new.(key, options)
      end

      # key -> Symbol object - Name of method to get endpoint Files::Reader.
      # options -> Hash object - Each method needs a specific parameter
      def call(key, **options)
        path = options.empty? ? send(key) : send(key, Helpers::Url.escape(**options))

        path.strip
      rescue NoMethodError, ArgumentError => exception
        raise InvalidEndpointError.new("endpoint not found", details: exception.message)
      end

      private

      def shares
        Response[__method__]
      end

      def ugc_post
        Response[__method__]
      end

      # 'projection' - query to get specific attributes - optional
      def organizations(projection: nil, start: nil, count: nil)
        Response[__method__, { projection: projection, start: start, count: count }]
      end

      # 'identifier' - organization id - required
      # 'projection' - query to get specific attributes - optional
      def company(identifier:, projection: nil)
        Response[__method__, { identifier: identifier, projection: projection }]
      end

      # 'identifier' - organization id - required
      def logo(identifier:)
        Response[__method__, { identifier: identifier }]
      end

      def upload_image
        Response[__method__]
      end

      def register_asset_upload
        Response[__method__]
      end

      # 'projection' - query to get specific attributes - optional
      def me(projection: nil)
        Response[__method__, { projection: projection }]
      end
    end
  end
end
