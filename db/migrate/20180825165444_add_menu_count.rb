class AddMenuCount < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :max_count, :integer
  end
end
