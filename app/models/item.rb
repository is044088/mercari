class Item < ApplicationRecord

  
  belongs_to :user, foreign_key: 'salar_id'
  belongs_to :user, foreign_key: 'buyer_id'
  belongs_to :user, foreign_key: 'shipped_saler_id'
  belongs_to :user, foreign_key: 'received_buyer_id'
  belongs_to :category
  belongs_to :size
  belongs_to :brand
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
end