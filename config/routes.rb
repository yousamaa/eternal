# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index'

  get '/chat', to: 'chats#show'
  resources :tokens, only: [:create]

  # devise_for :developers
  # devise_for :gamers
  devise_for :users



  resources :developers, :gamers, :games


  get '/developers/games/add', to: 'developers#add_game'
  get '/developers/games', to: 'developers#show_games', as: 'developer_games'


  get 'carts/:id' => 'carts#show', as: 'cart'
  delete 'carts/:id' => 'carts#destroy'

  post 'cart_items' => 'cart_items#create'
  get 'cart_items/:id' => 'cart_items#show', as: 'cart_item'
  delete 'cart_items/:id' => 'cart_items#destroy'

  post 'checkout/create' => 'checkout#create', as: 'checkout_create'
  get 'checkout_success', to: 'checkout#checkout_success'

  get '/developers/games/:id', to: 'developers#game'
  get '/developers/games/:id/edit', to: 'developers#edit_games'

end
