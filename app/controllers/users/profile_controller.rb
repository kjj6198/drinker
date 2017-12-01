class Users::ProfileController < ApplicationController
  before_action :auth_google_user!
  def profile
    @histories = current_user.orders.order(created_at: :desc).limit(1000)
    @histories_sum = current_user.orders.sum(:price)
    @histories_count = current_user.orders.count(:id)
  end
end
