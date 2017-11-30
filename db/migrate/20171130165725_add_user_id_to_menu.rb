class AddUserIdToMenu < ActiveRecord::Migration[5.0]
  def change
    add_reference :menus, :user, foreign: true
  end
end
