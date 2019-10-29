class SignupController < ApplicationController

  def step0
  end

  def step1
    @user = User.new
  end

  def step2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:first_name] = user_params[:first_name]
    session[:family_name] = user_params[:family_name]
    session[:ja_first_name] = user_params[:ja_first_name]
    session[:ja_family_name] = user_params[:ja_family_name]
    @user = User.new 
  end

  def step3
    session[:authenticate_phone] = params[:authenticate_phone]
    @user = User.new
    @user.build_address
  end

  def step4
    session[:address_attributes] = user_params[:address_attributes]
    @user = User.new
    @user.build_card
  end

  def step5
    
  end

  def step6
  end
  
  private
  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation, 
      :first_name, 
      :family_name, 
      :ja_first_name, 
      :ja_family_name,
      address_attributes: [:id, :postal_code, :prefecture, :city, :street_name, :building_name, :delivery_phone]
  )
  end
end


