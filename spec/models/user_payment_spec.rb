require 'rails_helper'

RSpec.describe UserPayment, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @user_payment = FactoryBot.build(:user_payment, user_id: user.id, item_id: item.id)
    end
    describe '商品購入ができる' do
      it 'postal_code,shipment_source_id,city,address,building,phone,user_id,item_idが空でないとき' do
        expect(@user_payment).to be_valid
      end
    end
    describe '商品購入ができないとき' do
      it 'postal_codeが空のとき' do
        @user_payment.postal_code = ''
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeに-が含まれていないとき' do
        @user_payment.postal_code = '0001111'
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeに半角文字列以外が含まれていたとき' do
        @user_payment.postal_code = '０００−１１１１'
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_code「3桁ハイフン4桁」でないとき' do
        @user_payment.postal_code = '0001-111'
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("Postal code is invalid")
      end
      it 'addressが空のとき' do
        @user_payment.address = ''
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("Address can't be blank")
      end
      it 'shipment_source_idが空のとき' do
        @user_payment.shipment_source_id = ''
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("Shipment source can't be blank")
      end
      it 'cityが空のとき' do
        @user_payment.city = ''
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("City can't be blank")
      end
      it 'phoneに半角数値以外が含まれているとき' do
        @user_payment.phone = '000-1111-2222'
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneが10桁未満の場合' do
        @user_payment.phone = '11112222'
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneが12桁以上のとき' do
        @user_payment.phone = '000111122223'
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneが空のとき' do
        @user_payment.phone = ''
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("Phone can't be blank")
      end
      it 'user_idが空のとき' do
        @user_payment.user_id = ''
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("User id can't be blank")
      end
      it 'item_idが空のとき' do
        @user_payment.item_id = ''
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("Item id can't be blank")
      end
    end
  end
end
