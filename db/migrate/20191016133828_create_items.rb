class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string      :name,                  null:false
      t.integer     :price,                 null:false
      t.text        :explanation,           null:false
      t.string      :condition,             null:false
      t.string      :shipping_charge,       null:false
      t.string      :delivery_source_area,  null:false
      t.integer     :delivery_days,         null:false
      t.integer     :commission,            null:false
      t.integer     :profit,                null:false
      t.references  :category,              null:false
      t.references  :brand
      t.references  :size,                  null:false
      t.references  :saler,                 null:false
      t.references  :buyer
      t.references  :shipped_saler
      t.references  :received_buyer
      t.integer     :like_num
      t.timestamps
    end
    add_foreign_key :items, :categories, column: :category_id
    add_foreign_key :items, :brands,     column: :brand_id
    add_foreign_key :items, :sizes,      column: :size_id
    add_foreign_key :items, :users,      column: :saler_id
    add_foreign_key :items, :users,      column: :buyer_id
    add_foreign_key :items, :users,      column: :shipped_saler_id
    add_foreign_key :items, :users,      column: :received_buyer_id
  end
end
