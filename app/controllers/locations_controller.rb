class LocationsController < ApplicationController
  before_action :find_location, only: [:show]
  def index
    @locations = Location.all

    @markers = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng  location.longitude
    end
  end

  def show

  end

  private

  def find_location
    @location = Location.find(params[:id])
  end
end
