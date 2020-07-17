module LinkedinV2
  module Api
    module Assets
      def register_asset_upload(**options)
        body = LinkedinV2::Templates::Payloads::RegisterAssetUpload.new(options)
        path = LinkedinV2::Url::Builder.(:register_asset_upload)

        request(:post, path, body.to_json, post_headers)
      end

      def upload_asset(**options)
        registerAssetUploadResponse = register_asset_upload(options)
        uploadUrl = LinkedinV2::Helpers::Hash.get_deep(
          registerAssetUploadResponse,
          "value",
          "uploadMechanism",
          "com.linkedin.digitalmedia.uploading.MediaUploadHttpRequest",
          "uploadUrl"
        )
        file = Files::Creator.(options[:asset_url])
        body = file

        request(:put, nil, body, post_headers, uploadUrl, nil)
      ensure
        Files::Destroyer.(file)
      end
    end
  end
end
