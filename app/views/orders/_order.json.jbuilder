json.extract! order, :id, :created_at, :updated_at, :has_paid
json.url menu_order_url(order, format: :json)
