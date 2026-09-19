require "httparty"

class PexelsClient
  include HTTParty
  base_uri "https://api.pexels.com"

  def initialize
    @options = { headers: { "Authorization" => ENV["pexels_api_key"], "Accept" => "application/json" } }
  end

  def fetch_collection(collection_id)
    source = "/v1/collections/" + collection_id
    options = { type: "photos" }.merge(@options)
    response = self.class.get(source, options)
    if response.success?
      response.parsed_response
    else
      # Make this more official, call or catch an error?
      "Error: #{response.code}"
    end
  end
end