class CreateSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :sizes do |t|
      t.string  :price,          null: false
      t.integer :size_group_num, null: false
      t.timestamps
    end
  end
end
