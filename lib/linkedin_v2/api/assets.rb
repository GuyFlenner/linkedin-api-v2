module LinkedinV2
  module Api
    module Assets
      def register_asset_upload(**options)
        body = LinkedinV2::Templates::Payloads::RegisterAssetUpload.new(options)
        path = LinkedinV2::Url::Builder.(:register_asset_upload)

        request(:post, path, body.to_json, post_headers)
      end
  end
end
