class Card < ApplicationRecord
  belongs_to :user,  optional: true

  validates :customer_id, presence: true, on: :validates_step4
  validates :ecard_id,    presence: true, on: :validates_step4

end
