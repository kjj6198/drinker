# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shops = [
  "迷客夏",
  "一芳水果茶",
  "五十嵐",
  "溪-泡泡桔子",
  "COCO",
  "星巴克",
  "茶湯會",
  "會新兵店",
  "珍煮丹",
  "大苑子",
  "水巷茶弄"
];

15.times do |i|
  drink_shop = DrinkShop.new
  drink_shop.name = shops.sample + rand(10).to_s
  drink_shop.phone = "02-2457-4561"
  drink_shop.address = "新北市新店區三民路81號1樓"
  drink_shop.image_url = "http://via.placeholder.com/800x600"
  drink_shop.save
end