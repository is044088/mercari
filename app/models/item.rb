class Item < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'salar_id', optional: true
  belongs_to :user, class_name: 'User', foreign_key: 'buyer_id', optional: true
  belongs_to :user, class_name: 'User', foreign_key: 'shipped_saler_id', optional: true
  belongs_to :user, class_name: 'User', foreign_key: 'received_buyer_id', optional: true
  belongs_to :category
  belongs_to :size
  belongs_to :brand
  has_many :likes
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  validates :name, presence: true
  validates :price, presence: true
  validates :explanation, presence: true
  validates :condition, presence: true
  validates :delivery_source_area, presence: true
  validates :delivery_days, presence: true
  validates :shipping_charge, presence: true
  validates :profit, presence: true
  validates :commission, presence: true
  validates :how_to_ship, presence: true
  validates :category_id, presence: true
  validates :size_id, presence: true
end