Rails.application.routes.draw do
  # get 'rooms/new'
  # get 'users/edit'
  devise_for :users
  # get 'messages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "messages#index"
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  # resources :rooms, only: [:new, :create]
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
