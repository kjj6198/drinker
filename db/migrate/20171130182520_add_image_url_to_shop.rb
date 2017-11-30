class AddImageUrlToShop < ActiveRecord::Migration[5.0]
  def change
    add_column :drink_shops, :image_url, :string
  end
end
