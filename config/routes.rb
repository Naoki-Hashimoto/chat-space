Rails.application.routes.draw do
  devise_for :users
  resources :users, except: :destroy
  root 'groups#index'
  resources :groups, only: %i(index new edit create update) do
    resources :messages, only: %i(index create)
  end
end
