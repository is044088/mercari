class CreateReputations < ActiveRecord::Migration[5.0]
  def change
    create_table :reputations do |t|
      t.references :rater,   null:false
      t.references :target,  null:false
      t.integer    :rate,    null:false
      t.text       :comment, null:false
      t.timestamps
    end
    add_foreign_key :reputations, :users, column: :rater_id
    add_foreign_key :reputations, :users, column: :target_id
  end
end