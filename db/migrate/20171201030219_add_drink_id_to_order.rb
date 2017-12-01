class AddDrinkIdToOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :drink, foreign_key: true
  end
end
