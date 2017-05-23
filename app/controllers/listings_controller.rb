class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :destroy]

  def index
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.kitchen = current_user.kitchen

  end

  def edit
    # @listing set by set_listing method
  end

  def update
    # @listing set by set_listing method
    @listing.update(listing_params)
    @listing.destroy

    @listing.save

    redirect_to listing_path(@listing)
  end

  def destroy
    # @listing set by set_listing method
    @listing.destroy

    redirect_to listings_path
  end

  def show
    # @listing set by set_listing method
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:start_time, :end_time, :price_per_hour)
  end

end
