Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: :registrations}
  root "static_pages#home"
  get "help" => "static_pages#help"
  resources :users, only: [:index]

  namespace :admin do
    root "static_pages#home"
    resources :users
    resources :books
    resources :requests, only: [:index, :show, :update]
  end
  resources :relationships, only: [:create, :destroy]
  resources :books
  resources :users, only: [:show]
  resources :user_books, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy, :index]
  resources :favorites, only: [:create, :destroy]
  resources :reviews
  resources :comments
  resources :requests, except: [:show, :edit, :update]
  resources :likes, only: [:create, :destroy]
end
