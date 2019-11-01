class ChangeDateAddress < ActiveRecord::Migration[5.0]
  def change
    change_column :addresses, :delivery_phone, :string
  end
end
