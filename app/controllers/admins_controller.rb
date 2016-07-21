class AdminsController < ApplicationController
  before_action :authenticate_admin, only: [:index]
  before_action :admin_choice, only: [:index]

  def index
    @locations = Location.all.order('name ASC').paginate(page: params[:page], per_page: 10)
    @events = Event.all.order(:start_date).paginate(page: params[:page], per_page: 10)

  end

  private

  def authenticate_admin
    if !current_user || current_user.permission != "admin"
      redirect_to root_path, notice: "Please log in as an admin first"
    end
  end

  def admin_choice
    @choice = params[:choice]
  end
end
