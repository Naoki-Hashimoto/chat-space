Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :index
  root 'groups#index'
  resources :groups, only: [:index,:new, :edit, :create, :update] do
    resources :messages, only: [:index, :create]
  end
end
