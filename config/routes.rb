# typed: strict
# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#home'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'

  resources :users, only: %i[new create]

  resources :whiskeys
  get 'search', to: 'whiskeys#search'
end
