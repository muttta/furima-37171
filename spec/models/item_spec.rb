require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end 

  describe '商品の出品' do


    context '商品の出品ができる時' do

      it'item_name,item_price,description,category_id,status_id,delivery_period_id,delivery_fee_id,shipment_source_id,imageが空でないとき' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができないとき' do

     it 'imageが空では登録ができない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
     end
     it 'item_nameが空では登録ができない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it 'descriptionが空では登録ができない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
     end
     it 'category_idが空では登録ができない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'status_idが空では登録ができない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
     end
     it 'delivery_period_idが空では登録ができない' do
      @item.delivery_period_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery period can't be blank")
    end
    it 'delivery_fee_idが空では登録ができない' do
      @item.delivery_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
     end
     it 'shipment_source_idが空では登録ができない' do
      @item.shipment_source_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment source can't be blank")
    end
    it 'item_priceが空では登録ができない' do
      @item.item_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price can't be blank")
     end
     it 'item_priceは半角数字でないと登録ができない' do
      @item.item_price = '１１１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price は半角数字で入力してください")
    end
    it 'item_priceは300未満では登録ができない' do
      @item.item_price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price は300円~9,999,999円の間で設定して下さい")
    end
    it 'item_priceは10,000,000以上では登録ができない' do
      @item.item_price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price は300円~9,999,999円の間で設定して下さい")
    end
    end
  end
end
