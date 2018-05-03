class PagesController < ApplicationController
  def index
    @menus = Menu.all.includes(:drink_shop).order(created_at: :desc).limit(20)
  end

  def rank
    result = ActiveRecord::Base.connection.execute("
      SELECT
        username,
        SUM(price),
        rank() OVER (ORDER BY sum(price) DESC) AS myrank
        FROM orders
        INNER JOIN users ON orders.user_id = users.id
        GROUP BY user_id, users.username
    ")

    @rank = result.map{ |record| record.symbolize_keys }
    respond_to do |format|
      format.json { render @rank }
      format.html { render :rank }
    end
  end
end
