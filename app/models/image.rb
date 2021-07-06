class Image < ApplicationRecord
  belongs_to :order
  belongs_to :user
  has_one_attached :item

  validates :image, presence: true
end