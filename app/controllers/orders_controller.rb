class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_customer = OrderCustomer.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_customer = OrderCustomer.new(ordere_params)
    if @order_customer.valid?
      @order_customer.save
      redirect_to root_path 
    else
      render :index
    end
  end

  def new
    @order_customer = OrderCustomer.new
  end

  private
  def order_params
    params.require(:order_customer).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :price).merge(user_id: current_user.id, item_id: @item.id)
  end
  end

end

