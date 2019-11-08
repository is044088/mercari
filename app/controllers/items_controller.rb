class ItemsController < ApplicationController
  def index
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
  end

  def show
    @item = Item.find(1)
    @images = @item.images.includes(:item)
    @image_top = @images.find_by(image_id: @image.id)
  end

  def create
    @item = Item.new(item_parameter)
    @item.saler_id = current_user.id
    respond_to do |format|
      if @item.save
          params[:images][:images_url].each do |image|
            @item.images.create(images_url: image, item_id: @item.id)
          end
        format.html{redirect_to root_path}
      else
        @item.images.build
        format.html{render action: 'new'}
      end
    end
  end

  def update
  end

  def destroy
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
      images_attributes: [:image_url, :item_id])
      .merge(saler_id: current_user.id)
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
