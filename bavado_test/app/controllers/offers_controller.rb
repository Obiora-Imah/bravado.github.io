class OffersController < ApplicationController

  def index
    render json: paginate_offers || []
  end

  private

  def get_offers
    @offers = Offer.match_offers(
                params[:user_id],
                params[:department_id],
                params[:query],
                params[:sort]
              )
  end

  def paginate_offers
    page_size = 2
    current_page = params[:page] || 1
    stop = page_size * current_page
    start = stop - page_size
    get_offers
    @offers[start...stop]
  end

end
