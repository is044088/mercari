class CreateItemComments < ActiveRecord::Migration[5.0]
  def change
    create_table :item_comments do |t|
      t.references :user,    null: false
      t.references :item,    null: false
      t.text       :comment, null: false
      t.timestamps
    end
    add_foreign_key :item_comments, :users, column: :user_id
    add_foreign_key :item_comments, :items, column: :item_id
  end
end