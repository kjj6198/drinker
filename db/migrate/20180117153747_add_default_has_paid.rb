class AddDefaultHasPaid < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :has_paid, :boolean, :default => false
  end
end
