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
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
  end    
  

  private

  def item_params
    params.require(:item).permit(:id, :name, :price, :description, :category_id, :user_id, :created_at, :updated_at, :item_image_id, :status_id, :shopping_cost_id, :shopping_day_id, :prefecture_id, item_images_attributes: [:image])
  end

end
end
