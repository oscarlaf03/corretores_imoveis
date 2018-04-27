class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :destoy, :edit, :update]


  def index
  end

  def show
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    @building.user = current_user
    if @building.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = current_user
  end

  def set_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:address, :square_meters, :type, :title, :description, :cep, :user)
  end

end