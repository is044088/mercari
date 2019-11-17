Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :users
  resources :items
  resources :cards
  resources :reputations, only: [:index]
  
  resources :signup do
    collection do
      get 'step0' # 登録方法
      get 'step1' # 個人情報入力
      get 'step2' # 電話番号認証
      get 'step3' # 発送情報
      get 'step4' # 支払い情報
      post 'step5' # 登録完了後
    end
  end

  # マイページ
  get 'logout' => 'users#logout'
  get 'mypage' => 'users#show'
  get 'mypage/profile' => 'mypage#profile'
  get 'mypage/notification' =>'mypage#notification'
  get 'mypage/todo' => 'mypage#todo'
  get 'mypage/purchase' => 'mypage#purchase'
  get 'mypage/purchased' => 'mypage#purchased'
  get 'mypage/news' => 'mypage#news'
  get 'mypage/mydate' => 'mypage#mydate'
  get 'mypage/authenticate_phone' =>'mypage#authenticate_phone'
  get 'deliver_address' =>'mypage#deliver_address'
end