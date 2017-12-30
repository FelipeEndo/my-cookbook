Rails.application.routes.draw do
  root to: 'home#index'
  resources :recipes, only: [:new, :show, :create]
  resources :cuisines, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
