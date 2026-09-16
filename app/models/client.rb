class Client
    #include HTTParty

  def initialize
  end

  def collection(id)
    HTTParty.get("https://api.pexels.com/v1/collections/#{id}", headers: {
      "Authorization" => ENV["pexels_api_key"], "Accept" => "application/json" })
  end
end