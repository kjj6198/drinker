class Users::ProfileController < ApplicationController
  before_action :auth_google_user!
  def profile
    @histories = current_user.orders.order(created_at: :desc).limit(1000)
    @histories_sum = current_user.orders.sum(:price)
    result = ActiveRecord::Base.connection.execute("
      SELECT
        user_id,
        SUM(price),
        rank() OVER (ORDER BY sum(price) DESC) AS myrank
        FROM orders GROUP BY user_id;
    ")

    @histories_rank = result.select{ |record| record["user_id"] == current_user.id }.first.symbolize_keys[:myrank]
    @histories_count = current_user.orders.count(:id)
  end
end
