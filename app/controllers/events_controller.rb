class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy, :accept, :decline]
  before_action :filter_events, only: [:index]
  before_action :authenticate_admin, only: [:edit, :update]

  def index
    @events = @filtered_events.where(status: "accepted").paginate(page: params[:page], per_page: 6)
  end

  def show

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    # Set status to pending unless current_user is an admin
    if current_user && current_user.permission == "admin"
      @event.status = "accepted"
    else
      @event.status = "pending"
    end
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path
    else
      render "edit"
    end
  end

  def destroy
    @event.destroy
    redirect_to admins_path(choice: "events")
  end

  def accept
    @event.update(status: "accepted")
    redirect_to admins_path(choice: "events")
  end

  def decline
    @event.update(status: "declined")
    redirect_to admins_path(choice: "events")
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :location_id, :description, :link, :image, :image_cache, :start_date, :end_date, :email)
  end

  def filter_events
    @filtered_events = Event.where("end_date >= ?", Time.zone.now.beginning_of_day )
  end

  def authenticate_admin
    if !current_user || current_user.permission != "admin"
      redirect_to new_user_session_path, notice: "Please log in as an admin first"
    end
  end


end
