# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index'
  # root to: 'chats#show'
  # resources :tokens, only: [:create]

  # devise_for :developers
  # devise_for :gamers
  devise_for :users

  resource :developers, :gamers, :games, :users

  get '/developers/add_game', to: 'developers#add_game'
  get '/developers/games', to: 'developers#show_games', as: 'developer_games'
end
