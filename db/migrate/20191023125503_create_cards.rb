class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.references :user,        null: false
      t.string     :customer_id, null: false
      t.string     :ecard_id,    null: false
      t.timestamps
    end
    add_foreign_key :cards, :users, column: :user_id
  end
end