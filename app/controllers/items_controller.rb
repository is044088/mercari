class ItemsController < ApplicationController
  def index
    #親カテゴリが「レディース」の商品(作成日付で降順)
    @ladies_items = Item.where(category_id: 1..218).order(created_at: "desc").limit(10)

    #親カテゴリがメンズの商品(作成日付で降順)
    @mens_items = Item.where(category_id: 219..377).order(created_at: "desc").limit(10)

    #ブランド：シャネルを抽出
    @syaneru = Item.where(brand_id: 2447).order(created_at: "desc").limit(10)
  end

  def new
    @item = Item.new
    @image = @item.images.build

      #セレクトボックスの初期値設定
      @category_parent_array = ["---"]

      #データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
         @category_parent_array << parent.name
      end
  end

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def show
    # クリックした商品の取得
    @item = Item.find(params[:id])
    @likes_count = Like.where(item_id: @item.id).count
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
    @item = Item.new(item_parameter)
    respond_to do |format|
      num = 0
      if @item.save
        while params[:item][:images_url].length > num do
          @item.images.create(images_url: params[:item][:images_url][num].original_filename)
          num += 1
        end
        format.html{redirect_to root_path}
      else
        @item.images.build
        format.html{render action: 'new'}
      end
    end
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


  def item_parameter
    params.require(:item).permit(
      :name,
      :price,
      :explanation,
      :condition,
      :shipping_charge,
      :delivery_source_area,
      :delivery_days,
      :commission,
      :profit,
      :category_id,
      :brand_id,
      :size_id,
      :saler_id,
      :buyer_id,
      :shipped_saler_id,
      :received_buyer_id,
      :like_num,
      :how_to_ship,
      images_attributes: {images_url: []})
      .merge(saler_id: 2)
  end

  # 親カテゴリーが選択された後に動くアクション
   def get_category_children
      #選択された親カテゴリーに紐付く子カテゴリーの配列を取得：親カテゴリー名で検索
      @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
   end

   # 子カテゴリーが選択された後に動くアクション
   def get_category_grandchildren
      #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得:idで検索
      @category_grandchildren = Category.find("#{params[:child_id]}").children
   end

   def get_size
        selected_grandchild = Category.find(params[:grandchild_id]) #孫カテゴリーを取得
    if related_size_parent = selected_grandchild.sizes[0] #孫カテゴリーと紐付くサイズ（親）があれば取得
       @sizes = related_size_parent.children #紐づいたサイズ（親）の子供の配列を取得

    else
        selected_child = Category.find(params[:grandchild_id]).parent #孫カテゴリーの親を取得
       if related_size_parent = selected_child.sizes[0] #孫カテゴリーの親と紐付くサイズ（親）があれば取得
          @sizes = related_size_parent.children #紐づいたサイズ（親）の子供の配列を取得
       end
    end
  end

      def get_brand
        selected_grandchild = Category.find(params[:grandchild_id]) #孫カテゴリーを取得
        @brands = []
      if related_brand_parent = selected_grandchild.brands[0] #孫カテゴリーと紐付くサイズ（親）があれば取得
        Brand.where('name LIKE(?)', "%#{params[:keyword]}%").where(ancestry: related_brand_parent.id).limit(10).each do |brand|
        @brands << brand
        end
      else
        selected_child = Category.find(params[:grandchild_id]).parent #孫カテゴリーの親を取得
      if related_brand_parent = selected_child.brands[0] #孫カテゴリーの親と紐付くサイズ（親）があれば取得
        Brand.where('name LIKE(?)', "%#{params[:keyword]}%").where(ancestry: related_brand_parent.id).limit(10).each do |brand|
          @brands << brand
          end
      end
    end
  end
end
