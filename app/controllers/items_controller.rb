class ItemsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_item, only: [:show, :edit, :update, :destroy,]

  def index
    # @item = Item.all
  end

  def new
    @item = Item.new   
  end

  def create
    @item = Item.new(item_params)
    
    if @item.save
      redirect_to root_path
    else
      render :new
    end 
  end   

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :user_id, :updated_at, :status_id, :shopping_cost_id, :shopping_day_id, :prefecture_id, :image ).merge(user_id: current_user.id)
  end

  # def set_item
  #   @item = Item.find(params[:id])
  # end
end

  


