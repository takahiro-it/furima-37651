class ItemsController < ApplicationController
  # before_action :set_item, only: [:show, :edit, :destroy]
  # before_action :authenticate_user!, except: [:index]

  before_action :require_login, only: :new, alert: 'You need to sign in or sign up before continuing.'
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
end
