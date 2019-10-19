class AddIndexToSize < ActiveRecord::Migration[5.0]
  def change
    add_index :sizes, :ancestry
  end
end
