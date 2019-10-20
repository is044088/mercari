class UsersController < ApplicationController


  def show
  end
  
  def logout
  end

  def update
    if current_user.update(profile_params)
      flash[:notice]= "変更しました"
      redirect_to mypage_profile_path
    else
      render :profile
    end
  end

  def profile

  end

  def notification
  end

  def todo
  end

  def purchase
  end

  def purchased
  end

  private
  def profile_params
    params.require(:user).permit(:nickname, :profile)
  end

end
