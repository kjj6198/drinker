class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { message: 'not found' }, status: 404
  end
end
