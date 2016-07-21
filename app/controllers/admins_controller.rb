class AdminsController < ApplicationController
  before_action :authenticate_admin, only: [:index]

  def index

  end

  private

  def authenticate_admin
    if current_user.permission != "admin"
      redirect_to root_path
    end
  end
end
