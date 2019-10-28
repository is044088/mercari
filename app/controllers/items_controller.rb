class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
    # クリックした商品の取得
    # @item = Item.find(params[:id])
    @item = Item.find(5)

    #クリックした商品の出品者の取得
    @user = User.find(@item.saler_id)

    #クリックした商品の出品者の評価
    @good_reputation = Reputation.where(target_id: @item.saler_id).where(rate: 1).count
    @normal_reputation = Reputation.where(target_id: @item.saler_id).where(rate: 0).count
    @bad_reputation = Reputation.where(target_id: @item.saler_id).where(rate: -1).count

    #クリックした商品のカテゴリ
    @cate = @item.category

    #クリックした商品の画像(複数)の取得 
    @images = Image.where(item_id: @item.id)

    #クリックした商品の最初の画像
    @image_top = Image.find_by(item_id: @item.id)

    #クリックした商品の出品者が出している商品全て(クリックした商品以外) 
     @user_items = Item.where(saler_id: @item.saler_id).where.not(id: @item.id).limit(6)

    #クリックした商品と同じカテゴリの商品
     @same_cate_items = Item.where(category_id: @item.category_id).where.not(id: @item.id).limit(6)
     
     @same_cate_item = Item.find_by(category_id: @item.category_id)
  end

  def create
  end

  def update
  end

  def destroy
  end
end