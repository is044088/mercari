class MypageController < ApplicationController

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
end
