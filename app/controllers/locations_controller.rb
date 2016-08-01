class LocationsController < ApplicationController
  before_action :find_location, only: [:show, :edit, :update, :destroy, :accept, :decline]
  before_action :filter_locations, only: [:index]
  before_action :authenticate_admin, only: [:edit, :update, :accept, :decline]


  def index
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
    # Set status to pending unless current_user is an admin
    if current_user && current_user.permission == "admin"
      @location.status = "accepted"
    else
      @location.status = "pending"
    end
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

  def destroy
    @location.destroy
    redirect_to admins_path(choice: "locations")
  end

  def accept
    @location.update(status: "accepted")
    redirect_to admins_path(choice: "locations")
  end

  def decline
    @location.update(status: "declined")
    redirect_to admins_path(choice: "locations")
  end

  private

  def find_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :description, :category, :picture, :link, :address, :email)
  end

  def filter_locations
    @category = params[:category]
    if @category && @category != "all"
      @locations = Location.where(category: @category, status: "accepted")
    else
      @locations = Location.where(status: "accepted")
    end
  end

  def authenticate_admin
    if !current_user || current_user.permission != "admin"
      redirect_to new_user_session_path, notice: "Please log in as an admin first"
    end
  end

end
