class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user,    null: false
      t.integer    :postal_code,   null: false
      t.string     :prefecture,    null: false
      t.string     :city,          null: false
      t.string     :street_number, null: false
      t.string     :building_name, null: false
      t.integer    :delivery_phone
      t.timestamps
    end
    add_foreign_key :addresses, :users, column: :user_id
  end
end