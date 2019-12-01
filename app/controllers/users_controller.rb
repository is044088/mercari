class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @trading_bought_items = current_user.trading_bought_items.limit(3).order('updated_at DESC')
    @bought_items = current_user.bought_items.limit(3).order('updated_at DESC')
  end

  def edit
  end

  def update
    if current_user.update_with_password(pass_params)
      sign_in(current_user, bypass: true)
      flash[:notice] = "変更しました"
      redirect_to edit_user_path
    else
      flash[:notice] = "変更はありません"
      render :edit
    end
  end

  private
  def email_params
    params.require(:user).permit(:email)
  end

  def pass_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end
end
