require "down"
require "rest-client"

module LinkedinV2
  API_URL ||= "https://api.linkedin.com/v2"
  API_V1_URL ||= "https://api.linkedin.com"
end

require_relative "linkedin_v2/version"

require_relative "linkedin_v2/error"

require_relative "linkedin_v2/helpers/handler"
require_relative "linkedin_v2/helpers/url"
require_relative "linkedin_v2/helpers/attribute"
require_relative "linkedin_v2/helpers/hash"

require_relative "linkedin_v2/url/builder"

require_relative "linkedin_v2/templates/payloads/base"
require_relative "linkedin_v2/templates/payloads/shares"
require_relative "linkedin_v2/templates/payloads/ugc_post"
require_relative "linkedin_v2/templates/payloads/register_asset_upload"

require_relative "linkedin_v2/files/reader"
require_relative "linkedin_v2/files/creator"
require_relative "linkedin_v2/files/destroyer"

require_relative "linkedin_v2/client"
