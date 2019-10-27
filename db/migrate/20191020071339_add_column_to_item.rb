class AddColumnToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :how_to_ship, :string, null:false
  end
end
