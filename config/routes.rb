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

  resources :items, only: [:new, :create] do
    resources :images, only: :create
    end
    resources :items, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
      #Ajaxで動くアクションのルートを作成
      collection do
        get 'get_category_children', defaults: { format: 'json' }
        get 'get_category_grandchildren', defaults: { format: 'json' }
      end
    end
end