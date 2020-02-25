Rails.application.routes.draw do
  root 'homes#index'
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :blogs
    resources :galleries
  end

  resources :blogs, only: [:show]
  resources :galleries, only: [:show]
  resources :users, only: [:show]
end
