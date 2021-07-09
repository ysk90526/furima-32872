require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @user_order = FactoryBot.build(:user_order, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end
  describe '商品購入' do
    context '商品購入できるとき' do
      it 'postcode、area_id、city、block、phone_number、token、user_id、item_idが存在すれば購入できること' do
        expect(@user_order).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @user_order.building = ''
        expect(@user_order).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'postcodeが空では購入できない' do
        @user_order.postcode = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeはハイフンが無ければ購入できない' do
        @user_order.postcode = '1234567'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postcode is invalid')
      end
      it 'aria_idが1では購入できない' do
        @user_order.area_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Area must be other than 1')
      end
      it 'cityが空では購入できない' do
        @user_order.city = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では購入できない' do
        @user_order.block = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @user_order.phone_number = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは9桁以下では購入できない' do
        @user_order.phone_number = '090123456'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは12桁以上では購入できない' do
        @user_order.phone_number = '090123456789'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは英数混合の値では購入できない' do
        @user_order.phone_number = 'abc12345678'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では購入できない' do
        @user_order.token = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では購入できない' do
        @user_order.user_id = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できない' do
        @user_order.item_id = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
