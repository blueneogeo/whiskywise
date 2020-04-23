# frozen_string_literal: true

Rails.application.routes.draw do
  root 'page#index'
  get '/about', to: 'page#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
