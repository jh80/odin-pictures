require "httparty"

class PexelsClient
  include HTTParty
  base_uri "https://api.pexels.com"

  def initialize
    @options = { format: :plain, headers: { "Authorization" => ENV["pexels_api_key"], "Accept" => "application/json" } }
  end

  def fetch_collection(collection_id)
    source = "/v1/collections/" + collection_id
    options = { type: "photos" }.merge(@options)
    json_response = self.class.get(source, options)
    parse_if_success(json_response)
  end

  def fetch_interated_page_of_collection(iterated_page_url)
    json_response = self.class.get(remove_v1(iterated_page_url), @options)
    parse_if_success(json_response)
  end

  private

  def parse_if_success(json_response)
    if json_response.code == 200
      JSON.parse(json_response.parsed_response, symbolize_names: true)
    else
      # Make this more official, call or catch an error?
      "Error: #{response.code}"
    end
  end

  def remove_v1(url)
    url.sub(/\/v1/, "")
  end
end
