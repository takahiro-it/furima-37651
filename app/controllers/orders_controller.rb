class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order_customer = OrderCustomer.new
    @customer = Customer.all
    redirect_to root_path if current_user.id == @item.user_id || @item.order != nil
    end
  end

  def create
    @order_customer = OrderCustomer.new(order_params)
    if @order_customer.valid?
      pay_item
      @order_customer.save
      current_user == @item.user
      redirect_to root_path unless current_user.id == @user_item.user_id
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_customer).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def prevent_url
    if @item.user_id == current_user.id || @item.order != nil
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end



