require "httparty"

class Client
  include HTTParty

  def initialize
  end

  def collection(collection_id, page = 1, type = "photos")
    source = "https://api.pexels.com/v1/collections/" + collection_id.to_s
    options = { page: page, type: type, format: :plain, headers: {
      "Authorization" => ENV["pexels_api_key"], "Accept" => "application/json" } }
    json_response = HTTParty.get(source, options)
    JSON.parse(json_response, symbolize_names: true)
  end
end