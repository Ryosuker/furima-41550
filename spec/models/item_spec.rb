require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '出品ができる場合' do
      it '商品画像〜販売価格まで全ての項目が存在していれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '出品ができない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be between ¥300 and ¥9,999,999')
      end
      it 'priceが300円未満では保存できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be between ¥300 and ¥9,999,999')
      end
      it 'priceが9,999,999円より大きいと保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be between ¥300 and ¥9,999,999')
      end
      it 'priceが全角数字だと保存できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be between ¥300 and ¥9,999,999')
      end

      it 'descriptionが空では保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが未選択では保存できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが未選択では保存できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_fee_payer_idが未選択では保存できない' do
        @item.shipping_fee_payer_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee payer can't be blank")
      end
      it 'shipping_area_idが未選択では保存できない' do
        @item.shipping_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_day_idが未選択では保存できない' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
