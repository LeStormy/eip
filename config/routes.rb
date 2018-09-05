Rails.application.routes.draw do
  resources :devlogs
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :home
  resources :devlogs

  root to: "home#index"
end
