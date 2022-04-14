class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_customer = OrderCustomer.new
    @customer = Customer.all
  end

  def new
    @order_customer = OrderCustomer.new
  end

  def create
    @order = OrderCustomer.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to item_orders_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_customer).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :price).merge(user_id: current_user.id)
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


