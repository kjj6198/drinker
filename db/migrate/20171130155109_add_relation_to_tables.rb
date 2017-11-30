class AddRelationToTables < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :user, foreign_key: true
    add_reference :orders, :drink_shop, foreign_key: true
    add_reference :drink_shops, :drink, foreign_key: true
    add_reference :drink_histories, :user, foreign_key: true
    add_reference :drink_histories, :drink, foreign_key: true
  end
end
