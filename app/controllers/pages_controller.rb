class PagesController < ApplicationController
  before_action :disable_nav, only: :home

  def show
    render template: "pages/#{params[:page]}"
  end

  def home

  end

  def form
    FormMailer.form(contact_params).deliver
    redirect_to root_path
 +    flash[:notice] = "E-mail succesfully sent"
  end


  private

  def disable_nav
    @disable_nav = true
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
