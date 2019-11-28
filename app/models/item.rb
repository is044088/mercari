class Item < ApplicationRecord
  belongs_to :saler, class_name: 'User'
  belongs_to :buyer, class_name: 'User'
  belongs_to :user, class_name: 'User', foreign_key: 'shipped_saler_id', optional: true
  belongs_to :user, class_name: 'User', foreign_key: 'received_buyer_id', optional: true
  belongs_to :category
  belongs_to :size
  belongs_to :brand
  has_many :likes
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
end