class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_customer = OrderCustomer.new
  end

  def new
    @order_customer = OrderCustomer.new
  end

  def create
    @order_customer = OrderCustomer.new(order_params)
    if @order_customer.valid?
      pay_item
      @order_customer.save
      redirect_to root_path 
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_customer).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end


