Rails.application.routes.draw do
  root 'sessions#new'
  get 'posts/new'
  get 'posts/create'
  get 'posts/index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#delete'
  resources :users
  resources :posts
end
