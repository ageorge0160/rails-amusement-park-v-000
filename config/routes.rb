Rails.application.routes.draw do
  root 'welcome#home'

  resources :users
  resources :attractions

  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  post 'ride/:id', to: 'attractions#ride', as: :ride
end
