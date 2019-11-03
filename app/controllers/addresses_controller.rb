class AddressesController < ApplicationController
  before_action :set_user

  def edit
    
  end

  def update
    @user.update(
      first_name: address_params[:first_name],
      family_name: address_params[:family_name],
      ja_first_name: address_params[:ja_first_name],
      ja_family_name: address_params[:ja_family_name]
    )
    @user.address.update(address_params[:address_attributes])
    if @user.save
      flash[:notice]= "変更しました"
      redirect_to edit_user_address_path(@user.id, @user.address.id)
    else
      render :edit
    end
  end

  private
  def address_params
    params.require(:user).permit(
      :first_name, 
      :family_name, 
      :ja_first_name, 
      :ja_family_name,
      address_attributes: [:id, :postal_code, :prefecture, :city, :street_number, :building_name, :delivery_phone]
    )
  end

  def set_user
    @user = User.find(current_user.id)
  end

end
