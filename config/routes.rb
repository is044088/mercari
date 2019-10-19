Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}
  devise_scope :user do
    get 'logout', to: 'users/sessions#logout', as: 'logout'
  end

  resources :items
end