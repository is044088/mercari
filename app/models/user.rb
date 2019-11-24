class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]
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

  has_many :saling_items,         -> { where("buyer_id is NULL") },              foreign_key: "saler_id", class_name: "Item"
  has_many :trading_sold_items,   -> { where("buyer_id is not NULL")},           foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items,           -> { where("received_buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :trading_bought_items, -> { where("buyer_id is not NULL") },          foreign_key: "buyer_id", class_name: "Item"
  has_many :bought_items,         -> { where("received_buyer_id is not NULL") }, foreign_key: "buyer_id", class_name: "Item"

  VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :nickname,               presence: true, length: {maximum: 20}, on: :validates_step1
  validates :email,                  presence: true, length: {minimum: 7, maximum: 20},  uniqueness: true, on: :validates_step1,format: { with: VALID_EMAIL_REGEX }
  # validates :password,               presence: true, length: {minimum: 7, maximum: 20},  uniqueness: true, on: :validates_step1,on: :save_to_session_before_phone
  # validates :password_confirmation, presence: true,                        on: :validates_step1,                               on: :save_to_session_before_phone
  validates :first_name,             presence: true,                        on: :validates_step1
  validates :family_name,            presence: true,                        on: :validates_step1
  validates :ja_first_name,          presence: true,                        on: :validates_step1
  validates :ja_family_name,         presence: true,                        on: :validates_step1
  validates :birthday,               presence: true,                        on: :validates_step1
  validates :authenticate_phone,     presence: true,                        on: :validates_step
  
  has_many :saling_items,         -> { where("buyer_id is NULL") },              foreign_key: 'saler_id', class_name: 'Item'
  has_many :trading_sold_items,   -> { where("buyer_id is not NULL")},           foreign_key: 'saler_id', class_name: 'Item'
  has_many :sold_items,           -> { where("received_buyer_id is not NULL") }, foreign_key: 'saler_id', class_name: 'Item'
  has_many :trading_bought_items, -> { where("buyer_id is not NULL") },          foreign_key: 'buyer_id', class_name: 'Item'
  has_many :bought_items,         -> { where("received_buyer_id is not NULL") }, foreign_key: 'buyer_id', class_name: 'Item'
end