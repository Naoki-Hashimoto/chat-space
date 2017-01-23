Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :group, only: [:new, :edit, :create, :update]
end
