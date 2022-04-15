require 'rails_helper'

RSpec.describe OrderCustomer, type: :model do
  describe 'create' do

    before do
      user = FactoryBot.build(:user)
      
      @order_customer = FactoryBot.build(:order_customer, user_id: user.id,)
    end

    # 購入関連
    context '商品が購入できる場合' do

      it '必須項目を入力した上で購入ができる' do
        expect(@order_customer).to  be_valid
      end
    end

    context '商品が購入できない場合' do

      it 'トークンが空だと登録できない' do
        @order_customer.token = nil
        @order_customer.valid?
        expect(@order_customer.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号がないと登録できない' do
        @order_customer.post_code = nil
        @order_customer.valid?
        expect(@order_customer.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号にハイフンがないと登録できない' do
        @order_customer.post_code = '7777777'
        @order_customer.valid?
        expect(@order_customer.errors.full_messages).to include("Post code is invalid")
      end

      it '都道府県についてのプルダウンが---だと登録できない' do
        @order_customer.prefecture_id = 0
        @order_customer.valid?
        expect(@order_customer.errors.full_messages).to include("Prefecture select")
      end

      it '市区町村がないと登録できない' do
        @order_customer.city = nil
        @order_customer.valid?
        expect(@order_customer.errors.full_messages).to include("City can't be blank")
      end

      it '番地がないと登録できない' do
        @order_customer.address = nil
        @order_customer.valid?
        expect(@order_customer.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号がないと登録できない' do
        @order_customer.phone_number = nil
        @order_customer.valid?
        expect(@order_customer.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が短いと登録できない' do
        @order_customer.phone_number = '000000'
        @order_customer.valid?
        expect(@order_customer.errors.full_messages).to include("Phone number is too short")
      end

      it '電話番号にハイフンがあると登録できない' do
        @order_customer.phone_number = '000-0000-0000'
        @order_customer.valid?
        expect(@order_customer.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
    end
  end
end

