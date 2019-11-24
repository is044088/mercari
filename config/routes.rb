Rails.application.routes.draw do
 
  root 'items#index'
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    resources :addresses, only: [:edit, :update]
  end
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
      get 'get_brand', defaults: { format: 'json' }
    end
end
  resources :cards, only: [:index, :new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  resources :mypage, only: [:edit, :update]

  resources :purchases, only: [:show] do
    collection do
      post 'pay', to: 'purchases#pay'
      get 'done', to: 'purchases#done'
      get 'sold', to: 'purchases#sold'
    end
  end

  get "items/index" => "items#index"
  get "items/show" => "items#show"
  get "items/delete" => "items#delete"
  post "likes/:item_id/create" => "likes#create"
  delete "likes/:item_id/destroy" => "likes#destroy"

  resources :signup do
    collection do
      get 'step0'  # 登録方法
      get 'step1'  # 個人情報入力
      get 'step2'  # 電話番号認証
      get 'step3'  # 発送情報
      post 'step4'  # 登録
      get  'done'  # 登録完了
    end
  end

  # マイページ
  get 'logout' => 'users#logout'
  get 'mypage' => 'users#show'
  get 'notification' =>'mypage#notification'
  get 'todo' => 'mypage#todo'
  get 'purchase' => 'mypage#purchase'
  get 'purchased' => 'mypage#purchased'
  get 'mydate' => 'mypage#mydate'
  get 'authenticate_phone' =>'mypage#authenticate_phone'
  get 'deliver_address' =>'mypage#deliver_address'
  
  # devise_for :users,
#  controllers: {
#   registrations: 'users/registrations' ,
#   omniauth_callbacks: 'users/omniauth_callbacks'
#  }
end