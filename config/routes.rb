# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index'
  
  # devise_for :developers
  # devise_for :gamers
  devise_for :users

  resource :developers

  get '/developers/add_game', to: 'developers#add_game'

end
