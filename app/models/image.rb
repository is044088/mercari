class Image < ApplicationRecord
  belongs_to :item, optional: true

  validates :images_url, presence: true
end