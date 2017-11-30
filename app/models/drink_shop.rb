class DrinkShop < ApplicationRecord
  has_many :drinks, dependent: :destroy
  has_many :menus
end
