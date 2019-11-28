class AddbuildingNametoAddress < ActiveRecord::Migration[5.0]
  def change
    def up
      change_column :addresses, :building_name, :string, null: true
    end
  
    def down
      change_column :addresses, :building_name, :string, null: false
    end
  end
end
