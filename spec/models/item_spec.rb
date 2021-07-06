require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'ログイン状態のユーザーのみ、商品出品ページへ遷移出来ること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'ログアウト状態では商品出品ページへ遷移出来ない' do
        @item.user_id = ''
        @item.valid?
      end
      it '商品画像がないと出品出来ない' do
        @item.image = nil
        @item.valid?
      end
      it  '商品名がないと出品出来ない' do
        @item.product_name = ''
        @item.valid?
      end
      it '商品の説明がないと出品出来ない' do
        @item.description = ''
        @item.valid?
      end
      it 'カテゴリーの情報がないと出品出来ない' do
        @item.category_id = '1'
        @item.valid?
      end
      it '商品の状態についての情報がないと出品できない' do
        @item.status_id = '1'
        @item.valid?
      end
      it '配送料の負担についての情報がないと出品出来ない' do
        @item.shipping_fee_id = '1'
        @item.valid?
      end
      it '発送元の地域についての情報がないと出品できない' do
        @item.shipping_form_id = '1'
        @item.valid?
      end
      it '発送までの日数についての情報がないと出品出来ない' do
        @item.day_ship_id = '1'
        @item.valid?
      end
      it '販売価格についての情報がないと出品出来ない' do
        @item.price = ''
        @item.valid?
      end
      it '販売価格は、¥300~¥9,999,999の間以外は出品出来ない' do
        @item.price = '100'
        @item.valid?
      end
      it ' 販売価格は半角数字以外は以外は保存出来ない' do
        @item.price = '１１１'
        @item.valid?
      end
    end
  end
end


