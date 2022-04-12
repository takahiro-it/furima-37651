class OrdersController < ApplicationController
  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @order_customer = OrderCustomer.new
  end

  def create
    @order_customer = OrderCustomer.new(order_params)
  end

  private
  def order_params
    params.require(:order_customer).permit(各カラム名).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

