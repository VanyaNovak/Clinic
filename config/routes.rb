Rails.application.routes.draw do
  namespace :admin do
      resources :categories
      resources :appointments
      resources :users
      resources :patients
      resources :doctors

      root to: "categories#index"
    end
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'home#index'
end
