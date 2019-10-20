Rails.application.routes.draw do
  root 'items#index'
  devise_for :users

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