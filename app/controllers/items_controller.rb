class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

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
end
