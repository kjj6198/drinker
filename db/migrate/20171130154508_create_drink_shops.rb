class CreateDrinkShops < ActiveRecord::Migration[5.0]
  def change
    create_table :drink_shops do |t|
      t.string :name, limit: 255, null: false
      t.string :phone, limit: 255, null: false
      t.text :comment
      t.string :address, null: false
      t.integer :rank

      t.timestamps
    end
  end
end
