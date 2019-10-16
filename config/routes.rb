Rails.application.routes.draw do
  get 'items/index'

  get 'items/new'

  get 'items/edit'

  get 'items/show'

  get 'items/create'

  get 'items/update'

  get 'items/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'images#index'
  resources :images
end
