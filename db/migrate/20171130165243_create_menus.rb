class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.datetime :end_time
      t.boolean :is_active

      t.timestamps
    end
  end
end
