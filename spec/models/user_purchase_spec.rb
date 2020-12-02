require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '購入の保存' do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    context '購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_purchase).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @user_purchase.postal_code = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_purchase.postal_code = '1234567'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @user_purchase.prefecture_id = 0
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'cityが空だと保存できないこと' do
        @user_purchase.city = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'building_nameは空でも保存できること' do
        @user_purchase.building_name = nil
        expect(@user_purchase).to be_valid
      end
      it 'addressが空だと保存できないこと' do
        @user_purchase.address = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @user_purchase.phone = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneにハイフンは不要で11桁以内でないと保存できないこと' do
        @user_purchase.phone = '090-1234-5678'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone is invalid. Don't include hyphen(-)")
      end
      it 'tokenが空では登録できないこと' do
        @user_purchase.token = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
