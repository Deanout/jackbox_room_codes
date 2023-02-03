Rails.application.routes.draw do
  root 'pages#home'
  post 'new_game', to: 'rooms#new_game'
  post 'play', to: 'rooms#play', as: 'play'
  resources :rooms
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
