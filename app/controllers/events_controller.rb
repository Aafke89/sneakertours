class EventsController < ApplicationController
  before_action :find_event, only: [:show]

  def index
    @events = Event.all
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
    params.require(:event).permit(:title, :location, :description, :link, :image, :start_date, :end_date)
  end



end
