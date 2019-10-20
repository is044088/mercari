class ChangeColumnToItem < ActiveRecord::Migration[5.0]
  def change
  # 変更内容
  def up
    change_column :items, :size, :references, null: false, default: 0
  end

  # 変更前の状態
  def down
    change_column :items, :size, :references, null: false
  end

  end
end
