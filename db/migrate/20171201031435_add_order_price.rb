class AddOrderPrice < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :price, :integer, :null => false
  end
end
