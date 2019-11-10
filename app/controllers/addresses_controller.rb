class AddressesController < ApplicationController

  def edit
  end

  def update
    if current_user.update(address_params)
      flash[:notice]= "変更しました"
      redirect_to edit_user_address_path(current_user.id, current_user.address.id)
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

end
