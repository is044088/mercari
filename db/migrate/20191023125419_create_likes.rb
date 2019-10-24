class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :user,    null: false
      t.references :item,    null: false
      t.timestamps
    end
    add_foreign_key :likes, :users, column: :user_id
    add_foreign_key :likes, :items, column: :item_id
  end
end