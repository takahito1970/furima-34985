FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    product_name  { '窓' }
    description   { '青' }
    category_id      { 5 }
    status_id        { 2 }
    shipping_fee_id  { 2 }
    shipping_form_id { 2 }
    day_ship_id      { 2 }
    price { 1000 }
    association :user
  end
end
