require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品購入がうまくいく時' do
      it '必要な情報を適切に入力すると、商品の購入ができること' do
        expect(@order_shipping).to be_valid
      end
      it '建物名は空でもでも保存できる' do
        @order_shipping.building_name = ''
        expect(@order_shipping).to be_valid
      end
      it '電話番号が11桁以内の数値であれば保存できる' do
        @order_shipping.phone_number = '12345678901'
        expect(@order_shipping).to be_valid
      end
      it '郵便番号の保存にはハイフン有りの情報だけが保存できる' do
        @order_shipping.postal_code = '123-4567'
        expect(@order_shipping).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it '郵便番号が空だと保存できないこと' do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にはハイフンがないと保存できないこと' do
        @order_shipping.postal_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県が空だと保存できないこと' do
        @order_shipping.shipping_form_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Shipping form must be other than 1')
      end
      it '市区町村が空だと保存できないこと' do
        @order_shipping.minicipality = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Minicipality can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_shipping.address = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は英数混合では登録できないこと' do
        @order_shipping.phone_number = '0901234abcd'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は11桁以内の数値以外は保存できない事' do
        @order_shipping.phone_number = '090123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が半角数字のみでないと登録できないこと' do
        @order_shipping.phone_number = '090-1234-5678'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では購入できないこと' do
        @order_shipping.user_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できないこと' do
        @order_shipping.item_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
