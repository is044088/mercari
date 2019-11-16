class LikesController < ApplicationController
   before_action :set_item

  def create
    @like = Like.create(user_id: 1, item_id: params[:item_id])
    # @current_user.id
    redirect_to("/items/#{params[:item_id]}")
  end

  def destroy
    @like = Like.find_by(user_id: 1, item_id: params[:item_id])
    # @current_user.id
    @like.destroy
    redirect_to("/items/#{params[:item_id]}")
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end
  
end
