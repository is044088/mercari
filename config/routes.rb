Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  
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

  resources :users
  get 'mypage' => 'users#show'
  get 'logout' => 'users#logout'
  get 'mypage/profile' => 'users#profile'
  get 'mypage/notification' => 'users#notification'
  get 'mypage/todo' => 'users#todo'
  get 'mypage/purchase' => 'users#purchase'
  get 'mypage/purchased' => 'users#purchased'
  resources :items
end