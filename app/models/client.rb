class Client
    #include HTTParty

  def initialize
  end

  def collection(id)
    json_response = HTTParty.get("https://api.pexels.com/v1/collections/#{id}", format: :plain, headers: {
      "Authorization" => ENV["pexels_api_key"], "Accept" => "application/json" })
    JSON.parse(json_response, symbolize_names: true)
  end
end