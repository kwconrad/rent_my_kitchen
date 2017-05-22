class KitchensController < ApplicationController
  before_action :set_kitchen, only: [:show, :edit, :destroy]

  def index
    @kitchens = Kitchen.all
  end

  def show
    # @kitchen set by :set_kitchen method
  end

  def new
    @kitchen = Kitchen.new
  end

  def create
    @kitchen = Kitchen.new(kitchen_params)
    @kitchen.owner = current_user
    if @kitchen.save
      redirect_to kitchen_path(@kitchen)
    else
      render :new
    end
  end

  def edit
    # @kitchen set by :set_kitchen method
  end

  def update
    if @kitchen.update(kitchen_params)
      redirect_to edit_kitchen_path(@kitchen)
    else
      render :edit
    end
  end

  def destroy
    # @kitchen set by :set_kitchen method
    @kitchen.destroy
  end

  private

  def set_kitchen
    @kitchen = Kitchen.find(params[:id])
  end

  def kitchen_params
    params.require(:kitchen).permit(:name, :description, :street_address, :city, :postal_code, :country, :capacity)
  end
end
