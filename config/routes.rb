# typed: strict
# frozen_string_literal: true

Rails.application.routes.draw do
  resources :whiskeys
  root 'sessions#home'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :users, only: %i[new create]
end
