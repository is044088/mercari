class AddColumnToSize < ActiveRecord::Migration[5.0]
  def change

    add_column :sizes, :ancestry, :string

    remove_column :sizes, :size_group_num, :integer, null: false

  end
end
