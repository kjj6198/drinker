class PagesController < ApplicationController
  def index
    @menus = Menu.all.includes(:drink_shop).order(created_at: :desc).limit(10)
  end
end
