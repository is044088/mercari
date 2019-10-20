class CreateCategoriesBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_brands do |t|
      t.references :category,    null: false
      t.references :brand,       null: false
      t.timestamps
    end
    add_foreign_key :categories_brands, :categories, column: :category_id
    add_foreign_key :categories_brands, :brands,     column: :brand_id
  end
end