class PagesController < ApplicationController
  def index
    @menus = Menu.all.includes(:drink_shop).order(created_at: :desc).limit(10)
  end

  def rank
    result = ActiveRecord::Base.connection.execute("
      SELECT
        user_id,
        SUM(price),
        rank() OVER (ORDER BY sum(price) DESC) AS myrank
        FROM orders GROUP BY user_id;
    ")

    @rank = result.map{ |record| record.symbolize_keys }
    render json: @rank
  end
end
