class MypageController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchases_items, only: [:purchase, :purchased]

# プロフィール

  def edit
  end

  def update
    if current_user.update(profile_params)
      flash[:notice]= "変更しました"
      redirect_to edit_mypage_path
    else
      render :edit
    end
  end
# プロフィールここまで 

  def deliver_address
  end

  def notification
  end

  def todo
  end

  def purchase
  end

  def purchased
  end

  def mydate
  end

  def authenticate_phone
  end

  def logout
  end

  private
  def profile_params
    params.require(:user).permit(:image_url, :nickname, :profile)
  end

  def set_purchases_items
    @trading_bought_items = current_user.trading_bought_items.all.order('updated_at DESC')
    @bought_items = current_user.bought_items.all.order('updated_at DESC')
  end
end
