class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category_id
  belongs_to :status_id
  belongs_to :shipping_fee_id
  belongs_to :shipping_form_id
  belongs_to :day_ship_id

  validates :id, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :shipping_fee_id, numericality: { other_than: 1 }
  validates :shipping_form_id,numericality: { other_than: 1 }
  validates :day_ship_id,numericality: { other_than: 1 }

end