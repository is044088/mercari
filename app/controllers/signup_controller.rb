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
    session['birthday(1i)'] = params[:user]['birthday(1i)'].to_i
    session['birthday(2i)'] = params[:user]['birthday(2i)'].to_i
    session['birthday(3i)'] = params[:user]['birthday(3i)'].to_i
    @user = User.new
  end

  def step3
    session[:authenticate_phone] = user_params[:authenticate_phone]
    @user = User.new
    @user.build_address
  end

  def step4
    # session[:postal_code] = user_params[:address_attributes]['postal_code']
    # session[:prefecture] = user_params[:address_attributes]['prefecture']
    # session[:city] = user_params[:address_attributes]['city']
    # session[:street_number] = user_params[:address_attributes]['street_number']
    # session[:building_name] = user_params[:address_attributes]['building_name']
    # session[:delivery_phone] = user_params[:address_attributes]['delivery_phone']
    session[:address] = user_params[:address_attributes]
    @user = User.new
    @user.build_card
  end

  def step5
    birthday_date = birthday_join
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      first_name: session[:first_name],
      family_name: session[:family_name],
      ja_first_name: session[:ja_first_name],
      ja_family_name: session[:ja_family_name],
      authenticate_phone: session[:authenticate_phone],
      image_url: "default_image.jp",
      birthday: birthday_date
    )
    # @address = Address.new(
    #   postal_code: session[:postal_code],
    #   prefecture: session[:prefecture],
    #   city: session[:city],
    #   street_number: session[:street_number],
    #   building_name: session[:building_name],
    #   delivery_phone: session[:delivery_phone]
    # )
    @user.build_address(session[:address])
    @user.build_card(user_params[:card_attributes])
    binding.pry
    if @user.save
      session[:user_id] = @user.id
      redirect_to("/")
    else
      render step4_signup_index_path 
    end
    
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
      :birthday,
      :authenticate_phone,
      address_attributes: [:id, :postal_code, :prefecture, :city, :street_number, :building_name, :delivery_phone],
      card_attributes: [:id, :customer_id, :ecard_id]
  )
  end

  def birthday_join
    birthday_date = Date.new session['birthday(1i)'].to_i,session['birthday(2i)'].to_i,session['birthday(3i)'].to_i
    return birthday_date
  end
end


