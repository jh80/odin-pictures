require "./app/models/client.rb"

class StaticPageController < ApplicationController
  def new
  end

  def create
  end

  def show
    pexels_client = PexelsClient.new
    collection_ps = collection_params
    if collection_ps[:increment_page]
      @response = pexels_client.fetch_interated_page_of_collection(collection_ps[:increment_page])
    else
      @response = pexels_client.fetch_collection(collection_ps[:collection_id])
    end
  end

  private

  def collection_params
    params.permit(:collection_id, :increment_page)
  end
end
