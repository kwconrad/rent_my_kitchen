class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :destroy]

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @kitchen.owner = current_user
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def edit
    # @listing set by set_listing method
  end

  def destroy
    # @listing set by set_listing method
    @listing.destroy

    redirect_to listings_path
  end

  def update
    # @listing set by set_listing method
    @listing.update(listing_params)
    @listing.save

    redirect_to listing_path(@listing)
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
