class AddDefaultState < ActiveRecord::Migration[5.0]
  def change
    change_column :menus, :is_active, :boolean, default: true
  end
end
