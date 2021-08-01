class OrderShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postar_code, :shipping_form_id, :minicipality, :address, :building_name, :phone_number,
                :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postar_code
    validates :minicipality
    validates :address
    validates :phone_number
    validates :token, presence: true
  end

  validates :shipping_form_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(order: order, postar_code: postar_code, shipping_form_id: shipping_form_id, minicipality: minicipality,
                    address: address, building_name: building_name, phone_number: phone_number)
  end
end
