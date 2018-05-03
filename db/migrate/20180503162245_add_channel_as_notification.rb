class AddChannelAsNotification < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :channel, :string
  end
end
