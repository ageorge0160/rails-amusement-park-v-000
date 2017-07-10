Rails.application.routes.draw do
  root 'welcome#home'

  resources :users
  resources :attractions

  get 'users/new', to: 'users#new'
  get 'signin', to: 'users#signin'
  post 'logout', to: 'sessions#destroy'
end
