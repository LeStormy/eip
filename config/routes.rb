Rails.application.routes.draw do
  resources :downloads
  resources :devlogs
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :home
  resources :devlogs
  get "/drafts", to: "devlogs#drafts"

  root to: "home#index"
end
