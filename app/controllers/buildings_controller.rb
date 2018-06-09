class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :destoy, :edit, :update ]


  def index
    @buildings = policy_scope(Building)
    @markers = @buildings.map do |building|
      {
        lat: building.latitude,
        lng: building.longitude#,
                # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def show
    @photos = @building.photos.all.order(created_at: :desc)
    @markers = [{ lat: @building.latitude, lng: @building.longitude }]
  end

  def new
    @building = Building.new(user: current_user)
    authorize @building
  end

  def create
    @building = Building.create(building_params)
    @building.user = current_user
    authorize @building
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
      unless params[:building][:photos].nil?
        params[:building][:photos].each do |photo|
          @photo = @building.photos.create!(image: photo)
        end
      end
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
    @building = Building.find_by_slug(params[:slug])
    authorize @building
  end

  def building_params
    params.require(:building).permit(:address, :square_meters, :type, :title, :description, :cep)
  end

end
