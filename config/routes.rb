Rails.application.routes.draw do

  devise_for :users
  root 'tickers#index'

  #devise_for :users

  resources :admin, only: [:index]

  namespace :admin do
    resources :tickers do
      resources :comments, only: [:index, :show, :destroy]
    end
    resources :users, only: [:index, :show, :destroy]
  end

  resources :tickers do
    resources :comments
  end

  resources :terms
  resources :pages

  get "search", to: "search#search"

end
