# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index'
  
  devise_for :users
  devise_for :gamers, only: :registrations
  devise_for :developers, only: :registrations


  resources :gamers, :admins, :carts, :orders

  get 'developer/new' => 'developers#register', :as => 'new_developer'

end
