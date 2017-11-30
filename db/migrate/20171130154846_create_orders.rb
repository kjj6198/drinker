class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.boolean :has_paid
      t.text :note

      t.timestamps
    end
  end
end
