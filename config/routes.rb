Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :users
  get "items/index" => "items#index"
  get "items/show" => "items#show"
  get "items/delete" => "items#delete"
  resources :items

  # マイページ
  get 'logout' => 'users#logout'
  get 'mypage' => 'users#show'
  get 'profile' => 'mypage#profile'
  get 'notification' =>'mypage#notification'
  get 'todo' => 'mypage#todo'
  get 'purchase' => 'mypage#purchase'
  get 'purchased' => 'mypage#purchased'
  get 'mydate' => 'mypage#mydate'
  get 'authenticate_phone' =>'mypage#authenticate_phone'
  get 'card' => 'mypage#card'
  get 'deliver_address' =>'mypage#deliver_address'
end