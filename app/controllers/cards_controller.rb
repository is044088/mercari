class CardsController < ApplicationController

  require "payjp"
  before_action :authenticate_user!
  before_action :card_exit, only: [:index, :new]
  # 今回、カード情報は１つだけ登録できるようにしているため、カード情報がある場合はshow（カード一覧）へ強制的にとばす

  def index
  end

  def new
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = "sk_test_02368ff94d28987a5012aff3"
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
    else
      Payjp.api_key = "sk_test_02368ff94d28987a5012aff3"
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to action: "index" 
    else
      Payjp.api_key = "sk_test_02368ff94d28987a5012aff3"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      @card_brand = @default_card_information.brand
      @exp_month = @default_card_information.exp_month.to_s
      @exp_year = @default_card_information.exp_year.to_s.slice(2,3)
      # カード画像の条件分岐
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

  private
  def card_exit
    # カード情報がある場合はshow(カード一覧)へ
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

end
