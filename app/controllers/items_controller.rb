class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, only: [:show, :edit, :update, :destroy,]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
    
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      redirect_to @item
    else
      render :new
  end    

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :user_id, :updated_at, :status_id, :shopping_cost_id, :shopping_day_id, :prefecture_id, images_attributes: [:url,:id, :_destroy]).merge(user_id: current_user.id, boughtflg_id:"1")
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end
end
end

