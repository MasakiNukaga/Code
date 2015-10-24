class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_codes = UserCode.where(user_id: @user.id).page(params[:page]).per(10).order(:id)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to action: 'index'
  end
end
