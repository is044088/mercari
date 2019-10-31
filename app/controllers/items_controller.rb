class ItemsController < ApplicationController
  def index
    #親カテゴリが「レディース」の商品(作成日付で降順)
    @ladies_items = Item.where(category_id: 1..218).order(created_at: "desc").limit(10)
    # @ladies_items = Item.find_by(category_id: 3)
    #親カテゴリがメンズの商品(作成日付で降順)
    @mens_items = Item.where(category_id: 219..377).order(created_at: "desc").limit(10)

    #ブランド：シャネルを抽出
    @syaneru = Brand.find(2447)#@syaneru.items
  end

  def new
  end

  def edit
    @item = Item.find_by(id: params[:id])
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