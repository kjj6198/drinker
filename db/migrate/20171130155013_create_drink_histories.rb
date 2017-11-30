class CreateDrinkHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :drink_histories do |t|
      t.references :user_id
      t.references :drink_id

      t.timestamps
    end
  end
end
