class PagesController < ApplicationController
  before_action :disable_nav, only: :home

  def show
    render template: "pages/#{params[:page]}"
  end

  def home

  end

  def form
    FormMailer.form(contact_params).deliver_now
    redirect_to root_path, notice: "Thanks for your email, we will reply as soon as possible"
  end


  private

  def disable_nav
    @disable_nav = true
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
