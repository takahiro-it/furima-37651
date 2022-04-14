require 'rails_helper'

RSpec.describe OrderCustomer, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
      @item.save
      @orders = FactoryBot.build(:orders_customer, item_id: @item.id, user_id: @user.id)
    end
    # 購入関連
    context '商品が購入できる場合' do
      it '必須項目を入力した上で購入ができる' do
        expect(@orders).to  be_valid
      end
    end

    context '商品が購入できない場合' do

      it 'トークンが空だと登録できない' do
        @orders.token = nil
        @orders.valid?
        expect(@orders.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号がないと登録できない' do
        @orders.post_code = nil
        @orders.valid?
        expect(@orders.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号にハイフンがないと登録できない' do
        @orders.postal_code = '7777777'
        @orders.valid?
        expect(@orders.errors.full_messages).to include('Post code Input correctly')
      end

      it '都道府県についてのプルダウンが---だと登録できない' do
        @orders.prefecture_id = 0
        @orders.valid?
        expect(@orders.errors.full_messages).to include('Prefecture select')
      end

      it '市区町村がないと登録できない' do
        @orders.city = nil
        @orders.valid?
        expect(@orders.errors.full_messages).to include("city can't be blank")
      end

      it '番地がないと登録できない' do
        @address = nil
        @orders.valid?
        expect(@orders.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号がないと登録できない' do
        @orders.phone_number = nil
        @orders.valid?
        expect(@orders.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が短いと登録できない' do
        @orders.phone_number = nil
        @orders.valid?
        expect(@orders.errors.full_messages).to include("Phone number is too short")
      end

      it '電話番号にハイフンがあると登録できない' do
        @orders.phone_number = '000-0000-0000'
        @orders.valid?
        expect(@orders.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end

