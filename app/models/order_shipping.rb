class OrderShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_form_id, :minicipality, :address, :building_name, :phone_number,
                :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :minicipality
    validates :address
    validates :phone_number
    validates :token
  end

  validates :shipping_form_id, numericality: { other_than: 1 }
  validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: "Phone number can't be blank" }
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(order: order, postal_code: postal_code, shipping_form_id: shipping_form_id, minicipality: minicipality,
                    address: address, building_name: building_name, phone_number: phone_number)
  end
end
