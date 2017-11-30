class PagesController < ApplicationController
  def index
    @menus = Menu.where(is_active: true).includes(:drink_shop).order(created_at: :desc).limit(10)
  end
end
