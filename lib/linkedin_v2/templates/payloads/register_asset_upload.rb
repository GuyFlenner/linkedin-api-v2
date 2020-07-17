module LinkedinV2
  module Templates
    module Payloads
      class RegisterAssetUpload < Base
        def initialize(**options)
          super(options)
        end

        def to_json
          payload.to_json
        end

        private

        attr_reader :options

        def payload
          body
        end

        def body
          {
            "registerUploadRequest" => {
              "owner" => "urn:li:#{entity}:#{identifier}",
              "recipes": [
                "urn:li:digitalmediaRecipe:feedshare-image"
              ],
              "serviceRelationships": [
                {
                  "identifier": "urn:li:userGeneratedContent",
                  "relationshipType": "OWNER"
                }
              ]
            }
          }
        end

        def entity
          options.fetch(:entity)
        end

        def identifier
          options.fetch(:identifier)
        end
      end
    end
  end
end
