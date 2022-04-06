class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @users = User.includes(:user)
  end

  def new
    @item = item.new
  end

  def create
    @user = user.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

end
