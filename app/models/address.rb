class Address < ApplicationRecord
  belongs_to :user,  optional: true

  validates :postal_code,   presence: true
  validates :prefecture,    presence: true
  validates :city,          presence: true
  validates :street_number, presence: true
  validates :building_name, presence: true
  validates :delivery_phone,presence: true
end
