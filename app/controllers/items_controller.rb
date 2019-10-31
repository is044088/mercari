class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def show
  end

  def create
  end

  def update
    @item = Item.find_by(id: params[:id])
    @item.name = params[:name]
    @item.price = params[:price]
    @item.explanation = params[:explanation]
    @item.condition = params[:condition]
    @item.shipping_charge = params[:shipping_charge]
    @item.delivery_source_area = params[:delivery_source_area]
    @item.delivery_days = params[:delivery_days]
    @item.commission = params[:commission]
    @item.profit = params[:profit]
    @item.category = params[:category]
    @item.brand = params[:brand]
    @item.size = params[:size]
    if @item.save
      flash[:notice] = "編集しました"
      redirect_to("/")
    else
      render("items/edit")
    end
  end

  def destroy
    @item = Item.find_by(id: params[:id])
    @item.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/")
  end
end
