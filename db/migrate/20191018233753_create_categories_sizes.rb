class CreateCategoriesSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_sizes do |t|
      t.references :category,    null: false
      t.references :size,        null: false
      t.timestamps
    end
    add_foreign_key :categories_sizes, :categories, column: :category_id
    add_foreign_key :categories_sizes, :sizes,      column: :size_id
  end
end
