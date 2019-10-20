class AddIndexToBrand < ActiveRecord::Migration[5.0]
  def change
    add_index :brands, :ancestry
  end
end
