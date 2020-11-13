require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品の保存' do
    context '出品が保存できる場合' do
      it 'すべての項目があればアイテムは保存される' do
        expect(@item).to be_valid
      end
    end
    context 'アイテムが保存できない場合' do
      it '画像がないとアイテムは保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないとアイテムは保存できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないとアイテムは保存できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーがないとアイテムは保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it '商品の状態がないとアイテムは保存できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Status is not a number')
      end
      it '配送料がないとアイテムは保存できない' do
        @item.shipping_cost = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping cost is not a number')
      end
      it '発送元の地域がないとアイテムは保存できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it '発送までの日数がないとアイテムは保存できない' do
        @item.shipping_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping days is not a number')
      end
      it '金額がないとアイテムは保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '金額は半角数字じゃないとないとアイテムは保存できない' do
        @item.price = '１１１１１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '金額は300円以上じゃないとないとアイテムは保存できない' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it '金額は300円以上じゃないとないとアイテムは保存できない' do
        @item.price = '1111111111111111'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end
      it 'ユーザーが紐付いていないとアイテムは保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
