require "./app/models/client.rb"

class StaticPageController < ApplicationController
  def new
  end

  def create
  end

  def show
    client = Client.new
    @response = client.collection(collection_id_params, "photos")
  end

  private

  def collection_id_params
    params.expect(:collection_id)
  end
end
