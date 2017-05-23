class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :destroy]

  def index
  end

  def new
    @listing = Listing.new
    @listing.start_time = Time.now
    @listing.end_time = Time.now + 2.hour
    @listing.price_per_hour = 6
    @kitchen = set_kitchen
  end

  def create
    @listing = Listing.new(listing_params)
    @kitchen = set_kitchen
    @listing.kitchen = @kitchen
    @listing.save

    redirect_to kitchen_listings_path(@kitchen)
  end

  def edit
    # @listing set by set_listing method
  end

  def update
    # @listing set by set_listing method
    @listing.update(listing_params)

    redirect_to kitchen_path(@kitchen)
  end

  def destroy
    # @listing set by set_listing method
    @listing.destroy

    redirect_to kitchens_path
  end

  def show
    # @listing set by set_listing method
  end

  private
  def set_kitchen
    @kitchen = Kitchen.find(params[:kitchen_id])
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:start_time, :end_time, :price_per_hour)
  end

end
