# typed: strict
# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#welcome'
  get 'about', to: 'page#about'

  resources :users, only: %i[new create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
end
