class RenameEcardIdColumnToCardIdCards < ActiveRecord::Migration[5.0]
  def change
    rename_column :cards, :ecard_id, :card_id
  end
end
