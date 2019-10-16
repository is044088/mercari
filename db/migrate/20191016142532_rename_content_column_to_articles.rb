class RenameContentColumnToArticles < ActiveRecord::Migration[5.0]
  def change
    rename_column :sizes, :price, :name
  end
end
