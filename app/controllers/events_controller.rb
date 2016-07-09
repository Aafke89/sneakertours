class EventsController < ApplicationController
  before_action :find_event, only: [:show]
  before_action :filter_events, only: [:index]

  def index
    @events = @filtered_events.paginate(page: params[:page], per_page: 6)
  end

  def show

  end

  def new
    @event = Event.new
  end



  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      redirect_to new_event_path
    end
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :location_id, :description, :link, :image, :start_date, :end_date)
  end

  def filter_events
    @filtered_events = Event.where("end_date >= ?", Time.zone.now.beginning_of_day )
  end


end
