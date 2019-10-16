class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :nickname,           index: true, null: false
      t.string  :email,              null: false, unique: true
      t.string  :password,           null: false
      t.string  :image_url,          null: false
      t.text    :profile
      t.string  :family_name,        null: false
      t.string  :first_name,         null: false
      t.string  :ja_family_name,     null: false
      t.string  :ja_first_name,      null: false
      t.integer :birthday,           null: false
      t.integer :authenticate_phone, null: false, unique: true
      t.timestamps
    end
  end
end
