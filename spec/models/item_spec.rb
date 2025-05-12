require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できる場合' do
      it '全ての項目が正しく入力されていれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it '商品名が空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '説明文が空では保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it '画像が添付されていないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'カテゴリーが---（id:1）だと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態が---（id:1）だと保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it '配送料の負担が---（id:1）だと保存できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
      end

      it '発送元地域が---（id:1）だと保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '発送までの日数が---（id:1）だと保存できない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time must be other than 1")
      end

      it '価格が空では保存できない' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end

      it '価格が300円未満では保存できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
      end

      it '価格が10,000,000円以上では保存できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
      end

      it '価格が全角数字では保存できない' do
        @item.item_price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end

      it '価格が文字列では保存できない' do
        @item.item_price = 'five hundred'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end

      it 'user（出品者）が紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
