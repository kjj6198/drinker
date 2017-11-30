class AddMenuReference < ActiveRecord::Migration[5.0]
  def change
    remove_reference :orders, :drink_shop, foreign: true
    add_reference :orders, :menu, foreign: true
    add_reference :menus, :drink_shop, foreign: true
  end
end
