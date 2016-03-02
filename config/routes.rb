Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: :registrations}
  root "static_pages#home"
  get "help" => "static_pages#help"
  resources :users, only: [:index]

  namespace :admin do
    root "static_pages#home"
    resources :users
    resources :books
  end
  resources :relationships, only: [:create, :destroy]
  resources :books
  resources :users, only: [:show]
  resources :user_books, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy, :index]
  resources :favorites, only: [:create, :destroy]
  resources :reviews, only: [:create]
end
