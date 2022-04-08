class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, only: [:show, :edit, :update, :destroy,]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
    # @item.item_images.new
    # @category_parent_array = Category.where(ancestry: nil).pluck(:name)
  end

  def create
    @item = Item.new(item_params)
    @item.seller_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path, flash: { error: @item.errors.full_messages }
    end
  end

  private

  def item_params
    params.require(:item).permit(:id, :name, :price, :description, :category_id, :user_id, :created_at, :updated_at, :item_image_id, :status_id, :shopping_cost_id, :shopping_day_id, :prefecture_id, item_images_attributes: [:image])
  end

end
