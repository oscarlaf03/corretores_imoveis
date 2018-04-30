class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :destoy, :edit, :update]


  def index
    @buildings = Building.all
  end

  def show
    @photos = @building.photos.all
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    @building.user = current_user
    if @building.save
      unless params[:building][:photos].nil?
        params[:building][:photos].each do |photo|
          @photo = @building.photos.create!(image: photo)
        end
      end
      respond_to do |format|
        format.html {redirect_to building_path(@building)}
        format.js
      end
    else
      respond_to do |format|
        format.html {render 'shared/form_building', building: @building}
        format.js
      end
    end
  end

  def edit
  end

  def update
    @building.update(building_params)
    if @building.save
      redirect_to building_path(@building)
    else
      render :edit
    end
  end

  def destroy
    @building.destroy
  end

  private

  def set_user
    @user = current_user
  end

  def set_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:address, :square_meters, :type, :title, :description, :cep)
  end

end
