class ChangeDateUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :birthday, :date, null: false
    change_column :users, :authenticate_phone, :string, null: false, unique: true
  end
end
