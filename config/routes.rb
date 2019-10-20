Rails.application.routes.draw do
  root 'items#index'
  devise_for :users

  resources :users
  get 'logout' => 'users#logout'
  resources :items

end