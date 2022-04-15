class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]

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
      redirect_to root_path unless current_user.id == @buy_item.user_id
    else
      render :index

    end
  end

  def show
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to root_path(@order.id) unless current_user.id == @buy_item.user_id
    else
      render :edit
    end
  end

  def destroy
    if @order.destroy
      redirect_to root_path
    else
      redirect :show
    end
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  private

  def order_params
    params.require(:order_customer).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
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



