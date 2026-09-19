require "httparty"

class Client
  include HTTParty # try commenting this out after things are built to see what it does
  base_uri "https://api.pexels.com"

  def initialize
    @options = { format: :plain, headers: { "Authorization" => ENV["pexels_api_key"], "Accept" => "application/json" } }
  end

  def collection(collection_id, page = 1, type = "photos")
    source = "/v1/collections/" + collection_id
    options = { page: page, type: type, format: :plain, headers: {
      "Authorization" => ENV["pexels_api_key"], "Accept" => "application/json" } }
    json_response = self.class.get(source, options)
    JSON.parse(json_response, symbolize_names: true)
  end

  def collection2(collection_id, page = 1, type = "photos")
    source = "https://api.pexels.com/v1/collections/" + collection_id.to_s
    options = { page: page, type: type, format: :plain, headers: {
      "Authorization" => ENV["pexels_api_key"], "Accept" => "application/json" } }
    json_response = HTTParty.get(source, options)
    JSON.parse(json_response, symbolize_names: true)
  end

  def move_page(page_url)
    response = HTTParty.get("https://api.pexels.com/v1/collections/zweidh0?page=2&per_page=15", @options)
    if response.success?
      JSON.parse(response, symbolize_names: true)
    end
    # Wrap in response success?
    # 
    # Wrap in response success?
  end
end