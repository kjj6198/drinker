class CreateDrinks < ActiveRecord::Migration[5.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :price
      t.string :note

      t.timestamps
    end
  end
end
