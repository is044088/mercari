class UsersController < ApplicationController


  def show
  end

  def edit
  end

  def update
    if current_user.update(profile_params)
      flash[:notice]= "変更しました"
      redirect_to mypage_profile_path
    else
      render :profile
    end
    
  end


  private
  def profile_params
    params.require(:user).permit(:image_url, :nickname, :profile)
  end

end
