Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: :registrations}
  root "static_pages#home"
  get "help" => "static_pages#help"
end
