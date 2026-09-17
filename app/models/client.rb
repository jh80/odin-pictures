class Client
    #include HTTParty

  def initialize
  end

  def collection(collection_id:, page: 1, type: "photos")
    json_response = HTTParty.get("https://api.pexels.com/v1/collections/#{id}?type=photos&page=#{page}&per_page=3", format: :plain, headers: {
      "Authorization" => ENV["pexels_api_key"], "Accept" => "application/json" })
    JSON.parse(json_response, symbolize_names: true)
  end
end