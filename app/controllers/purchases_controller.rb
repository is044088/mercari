class PurchasesController < ApplicationController

  require 'payjp'

  def show
    @item = Item.find(params[:id])
    @image = Image.find_by(item_id: @item.id)
    card = Card.find_by(user_id: current_user.id)
    #テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "cards", action: "new"
    elsif @item.buyer_id.blank?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
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
    else
      redirect_to action: "sold"
    end
  end

  def pay
    item = Item.find(params[:id])
    card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: item.price, #支払金額
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
    )
    item.update(buyer_id: current_user.id)
    redirect_to action: 'done' #完了画面に移動
  end

  def done #購入完了
  end

  def sold #商品売切
  end
end
