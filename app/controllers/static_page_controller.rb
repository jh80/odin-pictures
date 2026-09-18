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

  def collection_id_params
    params.expect(:collection_id)
  end
end
