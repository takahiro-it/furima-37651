class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :index, :create]
  before_action :move_to_index, except: [:index, :show]

  def index
    @item = Item.find(params[:item_id])
    @order_customer = OrderCustomer.new
    @customer = Customer.all
    redirect_to root_path if current_user.id == @item.user_id || @item.order != nil
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
      redirect_to root_path unless current_user.id == @user_item.user_id
    else
      render :index

    end
  end

  def show
    @order = Order.new
    @item = Item.find(params[:item_id])
    @item.order != nil
      redirect_to root_path(@order.id) unless current_user.id == @user_item.user_id
    end

  def edit
    @order = Order.new
    @item = Item.find(params[:item_id])
    if @item.user_id != current_user.id
      @item.order != nil
    current_user == @item.user
    redirect_to root_path(@order.id) unless current_user.id == @user_item.user_id

    redirect_to root_path(@order.id) if @item.order != nil

    # redirect_to root_path if current_user.id == @item.user_id || @item.order != nil
    # redirect_to root_path if ログイン中ユーザーが出品したユーザーであるもしくは商品が売却済み

    end
  end

  def update
    if @order.update(order_params)
      redirect_to root_path(@order.id) unless current_user.id == @user_item.user_id
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



