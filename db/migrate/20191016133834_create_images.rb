class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string     :images_url, null: false
      t.references :item,    null: false
      t.timestamps
    end
    add_foreign_key :images, :items, column: :item_id
  end
end
