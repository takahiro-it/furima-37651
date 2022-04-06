class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def credit_register
  end

  def logout
    @user = current_user
  end
end
