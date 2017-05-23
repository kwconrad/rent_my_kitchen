class BookingsController < ApplicationController
  before_action :set_booking, only: [ :edit, :update, :destroy, :show ]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(set_params)
    @kitchen = Kitchen.find(params[:kitchen_id])
    @booking.kitchen = @kitchen
    if @booking.save
      redirect_to kitchen_path(@kitchen)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(set_params)
      redirect_to kitchen_path
    else
      render :new
    end
  end

  def destroy
    @listing.destroy

    redirect_to kitchen_path(current_user.kitchen)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_params
    params.require(:booking).permit(:start_time, :end_time, :guests_count)
  end
end
