class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :card
  accepts_nested_attributes_for :card
  has_one :address
  accepts_nested_attributes_for :address
  has_many :items
  has_many :likes
  has_many :item_comments
  has_many :trade_comments
  has_many :reputations
  has_many :rater_users,  foreign_key: "rater_id",  class_name: "reputation"
  has_many :target_users, foreign_key: "target_id", class_name: "reputation"
  has_many :saling_items,         -> { where("buyer_id is NULL") },              foreign_key: 'saler_id', class_name: 'Item'
  has_many :trading_sold_items,   -> { where("buyer_id is not NULL")},           foreign_key: 'saler_id', class_name: 'Item'
  has_many :sold_items,           -> { where("received_buyer_id is not NULL") }, foreign_key: 'saler_id', class_name: 'Item'
  has_many :trading_bought_items, -> { where("buyer_id is not NULL") },          foreign_key: 'buyer_id', class_name: 'Item'
  has_many :bought_items,         -> { where("received_buyer_id is not NULL") }, foreign_key: 'buyer_id', class_name: 'Item'
end