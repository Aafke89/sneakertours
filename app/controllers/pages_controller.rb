class PagesController < ApplicationController
  before_action :disable_nav, only: :home

  def home

  end

  private

  def disable_nav
    @disable_nav = true
  end
end
