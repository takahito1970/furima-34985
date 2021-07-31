require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @items = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it '内容に問題がない場合、商品出品ページへ遷移出来ること' do
        expect(@items).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'user_idからの場合、商品出品ページへ遷移出来ない' do
        @items.user = nil
        @items.valid?
        expect(@items.errors.full_messages).to include('User must exist')
      end
      it '商品画像がないと出品出来ない' do
        @items.image = nil
        @items.valid?
        expect(@items.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品出来ない' do
        @items.product_name = ''
        @items.valid?expect(@items.errors.full_messages).to include("Product name can't be blank")
        
      end
      it '商品の説明がないと出品出来ない' do
        @items.description = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの情報がないと出品出来ない' do
        @items.category_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態についての情報がないと出品できない' do
        @items.status_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('Status must be other than 1')
      end
      it '配送料の負担についての情報がないと出品出来ない' do
        @items.shipping_fee_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('Shipping fee must be other than 1')
      end
      it '発送元の地域についての情報がないと出品できない' do
        @items.shipping_form_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('Shipping form must be other than 1')
      end
      it '発送までの日数についての情報がないと出品出来ない' do
        @items.day_ship_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('Day ship must be other than 1')
      end
      it '販売価格についての情報がないと出品出来ない' do
        @items.price = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格は、¥300~¥9,999,999の間以外は出品出来ない' do
        @items.price = 100
        @items.valid?
        expect(@items.errors.full_messages).to include('Price Out setting range')
      end
      it '販売価格は、¥300~¥9,999,999の間以外は出品出来ない' do
        @items.price = 10_000_000
        @items.valid?
        expect(@items.errors.full_messages).to include('Price Out setting range')
      end
      it ' 販売価格は半角数字以外は保存出来ない' do
        @items.price = '１１１'
        @items.valid?
        expect(@items.errors.full_messages).to include('Price Harf-widch number')
      end
      it ' 販売価格は半角英数混合は保存出来ない' do
        @items.price = 'aa1'
        @items.valid?
        expect(@items.errors.full_messages).to include('Price Harf-widch number')
      end
    end
  end
end
