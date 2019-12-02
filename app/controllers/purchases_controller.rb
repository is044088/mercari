class PurchasesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_item, only: [:show, :pay, :buyer_id_present]
  before_action :buyer_id_present, only: [:show, :pay]
  # buyer_idに値が入っているときは、強制的にsoldアクションへ飛ばす（購入者がすでにいるため）

  require 'payjp'

  def show
    @image = Image.find_by(item_id: @item.id)
    card = Card.find_by(user_id: current_user.id)
    #テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "cards", action: "new"
    else 
      Payjp.api_key = "sk_test_02368ff94d28987a5012aff3"
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
      @card_brand = @default_card_information.brand
      @exp_month = @default_card_information.exp_month.to_s
      @exp_year = @default_card_information.exp_year.to_s.slice(2,3)
      case @card_brand
      when "Visa"
        @card_brand_url = "visa.png"
      when "JCB"
        @card_brand_url = "jcbcard.png"
      when "MasterCard"
        @card_brand_url = "mastercard.png"
      when "American Express"
        @card_brand_url = "axcard.png"
      when "Diners Club"
        @card_brand_url = "dinersclub.png"
      when "Discover"
        @card_brand_url = "discover.png"
      end
    end
  end

  def pay
    card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = "sk_test_02368ff94d28987a5012aff3"
    Payjp::Charge.create(
      amount: @item.price, #支払金額
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
    )
    @item.update(buyer_id: current_user.id)
    redirect_to action: 'done' #完了画面に移動
  end

  def done #購入完了
  end

  def sold #商品売切
  end

  private
  def buyer_id_present
    redirect_to action: 'sold' if @item.buyer_id.present?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
