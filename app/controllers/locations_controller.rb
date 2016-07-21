class LocationsController < ApplicationController
  before_action :find_location, only: [:show, :edit, :update]
  before_action :filter_locations, only: [:index]
  def index
    # @locations = Location.all

    @markers = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng  location.longitude

      marker.infowindow render_to_string(partial: "/locations/infowindow", locals: {location: location})
      marker.picture({url: 'assets/marker.png',
                      width: 32,
                      height: 32 })
    end
  end

  def show
    @events = @location.events.where("end_date >= ?", Time.zone.now.beginning_of_day)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to location_path(@location)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to location_path
    else
      render "edit"
    end
  end

  private

  def find_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :description, :category, :picture, :link, :address)
  end

  def filter_locations
    @category = params[:category]
    if @category && @category != "all"
      @locations = Location.where(category: @category)
    else
      @locations = Location.all
    end
  end

end
