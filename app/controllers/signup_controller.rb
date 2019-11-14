class SignupController < ApplicationController
  before_action :validates_step1, only: :step2 
  before_action :validates_step2, only: :step3 
  before_action :validates_step3, only: :step4
  before_action :validates_step4, only: :step5


  def step0
  end

  def step1
    @user = User.new
  end

  def step2
    @user = User.new
  end

  def step3
    @user = User.new
    @user.build_address
  end

  def step4
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
    @user.build_address(session[:address])
    @user.build_card(user_params[:card_attributes])
    if @user.save
      session[:user_id] = @user.id
      redirect_to("/signup/done")
    else
      render step4_signup_index_path 
    end 
  end
  
  def done
    sign_in User.find(session[:user_id]) unless user_signed_in?
  end
  
#バリデーションーーーーーーーーーーーーーーーーーー

  def validates_step1 
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
    # date = Date.new session['birthday(1i)'].to_i,session['birthday(2i)'].to_i,session['birthday(3i)'].to_i
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      first_name: session[:first_name],
      family_name: session[:family_name],
      ja_first_name: session[:ja_first_name],
      ja_family_name: session[:ja_family_name],
      birthday: 00000000,
      authenticate_phone: '00000000'
    )
    unless @user.valid?(:validates_step1)
      flash[:notice] = @user.errors.full_messages 
      render '/signup/step1' 
    end
  end

  def validates_step2
    session[:authenticate_phone] = user_params[:authenticate_phone]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      first_name: session[:first_name],
      family_name: session[:family_name],
      ja_first_name: session[:ja_first_name],
      ja_family_name: session[:ja_family_name],
      birthday: '0000-00-00',
      authenticate_phone: session[:authenticate_phone]
    )
    unless @user.valid?(:validates_step2)
      flash[:notice] = @user.errors.full_messages 
      render '/signup/step2' 
    end
  end

  def validates_step3
    @user = User.new
    session[:address] = user_params[:address_attributes]
    @address = Address.new(
      postal_code: session[:address]['postal_code'],
      prefecture: session[:address]['prefecture'],
      city: session[:address]['city'],
      street_number: session[:address]['street_number'],
      building_name: session[:address]['building_name'],
      delivery_phone: session[:address]['delivery_phone']
    )
    unless @address.valid?(:validates_step3)
      flash[:notice] = @address.errors.full_messages
      render '/signup/step3'
    end
  end

  def validates_step4
    session[:card] = user_params[:card_attributes]
    @card = Card.new(
      customer_id: session[:card]['customer_id'],
      ecard_id: session[:card]['ecard_id']
    )
    unless @card.valid?(:validates_step4)
      flash[:notice] = @card.errors.full_messages
      render :step4
    end
  end





#ストロングーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
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


