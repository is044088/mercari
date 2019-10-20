class ChangeDataDeliveryDaysToItem < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :delivery_days, :string, null:false
  end
end