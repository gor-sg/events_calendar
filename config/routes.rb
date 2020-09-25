# frozen_string_literal: true

Rails.application.routes.draw do
  get 'profile/show'
  get 'profile/edit'
  get 'profile/update'
  use_doorkeeper

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions, only: :create
  resource :profile, only: [:update]

  resources :events
  get :me, to: 'profile#show'
  root to: 'sessions#new'
end
