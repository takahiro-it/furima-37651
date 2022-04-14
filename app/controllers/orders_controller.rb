class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def index
    @item = Item.find(params[:item_id])
    @order_customer = OrderCustomer.new
    @customer = Customer.all
    if current_user == @item.user
       redirect_to root_path
    end
  end

  def new
    @order_customer = OrderCustomer.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_customer = OrderCustomer.new(order_params)
    if @order_customer.valid?
      pay_item
      @order_customer.save
      current_user == @item.user
      redirect_to root_path
    else
      render :index

    end
  end

  private

  def order_params
    params.require(:order_customer).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
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



