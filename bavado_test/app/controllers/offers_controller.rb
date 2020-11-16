class OffersController < ApplicationController

  def index
    render json: OfferSerializer.new(paginate_offers).serializable_hash.to_json
  end

  private

  def get_offers
    Offer.match_offers(
      params[:user_id],
      params[:department_id],
      params[:query],
      params[:sort]
    )
  end

  def paginate_offers
    page_size = 30
    current_page = params[:page] || 1
    stop = page_size * current_page
    start = stop - page_size
    return all_offers(start, stop) unless params[:user_id].present?
    get_offers[start...stop]
  end

  def all_offers(start, stop)
    Offer.all[start...stop].each{|o| o.label = "offer"}
  end
end
