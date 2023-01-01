# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index'

  # devise_for :developers
  # devise_for :gamers
  devise_for :users

  resource :developers, :gamers, :games, :users

  get '/developers/games/add', to: 'developers#add_game'
  get '/developers/games', to: 'developers#show_games'
  get '/developers/games/:id', to: 'developers#game'
  get '/developers/games/:id/edit', to: 'developers#edit_games'
end
