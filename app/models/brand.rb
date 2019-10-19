class Brand < ApplicationRecord
  has_many :items
  has_many :categories_brands
  has_many :categories, through: :categories_brands
  has_ancestry
end
