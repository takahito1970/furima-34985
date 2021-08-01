FactoryBot.define do
  factory :order_shipping do
    postar_code { '123-4567' }
    shipping_form_id { 2 }
    minicipality { '福岡市博多区' }
    address { '中洲1-1' }
    building_name { '中洲ビル1-1' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
