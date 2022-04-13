class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    # @order_customer = OrderCustomer.all
  end

  def create
    @order_customer = OrderCustomer.create(order_params)
    Customer.create(customer_params)
    if @order_customer.valid?
      pay_item
      @order_customer.save
      redirect_to root_path 
    else
      render 'index'
    end
  end

  def new
  end

  private

  def order_params
    params.permit(:user, :item).merge(user_id: current_user.id, customer_id: @customer.id)
  end

  def customer_params
    params.permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(order_id: @order.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_***********"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end



