class AddColumnToBrand < ActiveRecord::Migration[5.0]
  def change

    add_column :brands, :ancestry, :string

    remove_column :brands, :brand_group_num, :integer, null: false

  end
end
