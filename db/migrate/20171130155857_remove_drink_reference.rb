class RemoveDrinkReference < ActiveRecord::Migration[5.0]
  def change
    remove_reference :drink_shops, :drink, foreign_key: true
    add_reference :drinks, :drink_shop, foreign_key: true
  end
end
