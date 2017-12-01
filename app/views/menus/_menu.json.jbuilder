json.extract! menu, :id, :name, :drink_shop, :total

json.orders menu.orders do |order|
  json.name order.name
  json.note order.note
  json.price order.price
  json.user order.user.email
end
