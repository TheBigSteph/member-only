Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#delete'
  resources :users
end
