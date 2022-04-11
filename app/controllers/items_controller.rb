class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  # before_action :set_item, only: [:show, :edit, :update, :destroy,]

  def index
    @items = Item.all.order(created_at: :desc)
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
  
  def show
    @item = Item.find(params[:id])
  end

  # def update
  #   if @item.update(item_params)
  #     redirect_to item_path(@item.id)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   if @item.destroy
  #     redirect_to root_path
  #   else
  #     redirect :show
  #   end
  # end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :user_id, :status_id, :shopping_cost_id, :shopping_day_id, :prefecture_id, :image ).merge(user_id: current_user.id)
  end

  # def set_item
  #   @item = Item.find(params[:id])
  # end

end

  


