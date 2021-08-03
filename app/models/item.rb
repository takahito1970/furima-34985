class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :shipping_form
  belongs_to :day_ship
  has_one :order

  with_options presence: true do
    validates :image
    validates :product_name
    validates :description
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Harf-widch number' }
  end
  validates :price, numericality: { greater_than: 299, less_than: 10_000_000, message: 'Out setting range' }
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_form_id
    validates :day_ship_id
  end
end
