class AdminsController < ApplicationController
  before_action :authenticate_admin, only: [:index]
  before_action :select_locations, only: [:index]
  before_action :select_events, only: [:index]
  before_action :admin_choice, only: [:index]
  before_action :show_logout, only: [:index]


  def index

  end



  private

  # Authenticate the admin
  def authenticate_admin
    if !current_user || current_user.permission != "admin"
      redirect_to new_user_session_path, notice: "Please log in as an admin first"
    end
  end

  # Show locations or events based on choice
  def admin_choice
    @choice = params[:choice]
  end

  # Show location based on selection
  def select_locations
    if params[:status] == "pending"
      @locations = Location.where(status: "pending").order('updated_at ASC').paginate(page: params[:page], per_page: 10)
    elsif params[:status] == "accepted"
      @locations = Location.where(status: "accepted").order('updated_at ASC').paginate(page: params[:page], per_page: 10)
    elsif params[:status] == "declined"
       @locations = Location.where(status: "declined").order('updated_at ASC').paginate(page: params[:page], per_page: 10)
    else
       @locations = Location.all.order('updated_at ASC').paginate(page: params[:page], per_page: 10)
    end
  end

  def select_events
    @events = Event.all.order(:start_date).paginate(page: params[:page], per_page: 10)
  end

  # Show logout instead of link to adminpage on adminpanel
  def show_logout
    @show_logout = true
  end
end
