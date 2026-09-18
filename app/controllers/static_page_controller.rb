require "./app/models/client.rb"

class StaticPageController < ApplicationController
  def new
  end

  def create
  end

  def show
    client = Client.new
    collection_ps = collection_params
    collection_id = collection_ps[:collection_id]
    page = collection_ps[:page] ? collection_ps[:page] : 1
    @response = client.collection(collection_id, page)
  end

  private

  def validated_parse(json_response)
    if json_response.successful?
      data =  JSON.parse(json_response, symbolize_names: true)
    else
      puts "Error: #{response.code}"
    end
  end

  def collection_params
    params.permit(:collection_id, :page)
  end
end
