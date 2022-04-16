class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index,]
  before_action :set_item, only: [:show, :edit, :update, :destroy,]

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
  end

  def edit
    redirect_to root_path if current_user.id != @item.user_id || @item.order != nil
   
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :new
    end
  end

  def destroy
  if @item.user_id == current_user.id
    @item.destroy
    redirect_to root_path
  else
      redirect :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :user_id, :status_id, :shopping_cost_id, :shopping_day_id, :prefecture_id, :image ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def prevent_url
    if @item.user_id != current_user.id || @item.orders != nil 
      redirect_to root_path
    end
  end

end


  


