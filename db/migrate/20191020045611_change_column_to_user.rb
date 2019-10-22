class ChangeColumnToUser < ActiveRecord::Migration[5.0]
  def change
    remove_index :users, :nickname
  end
end
