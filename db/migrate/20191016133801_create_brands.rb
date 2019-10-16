class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string  :name,            null: false
      t.integer :brand_group_num, null: false
      t.timestamps
    end
  end
end
