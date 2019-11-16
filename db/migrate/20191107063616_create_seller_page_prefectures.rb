class CreateSellerPagePrefectures < ActiveRecord::Migration[5.0]
  def change
    create_table :seller_page_prefectures do |t|
      t.integer :prefecture_id
      t.string :city

      t.timestamps
    end
  end
end
