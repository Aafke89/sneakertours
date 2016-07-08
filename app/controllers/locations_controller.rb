class LocationsController < ApplicationController
  before_action :find_location, only: [:show]
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

  end

  private

  def find_location
    @location = Location.find(params[:id])
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
