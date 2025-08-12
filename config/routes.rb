Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users

resources :users, only: [:show, :edit, :update] do
  member do
    delete :avatar
  end
end


  resources :connections, only: [:create, :update, :destroy]

  resources :messages, only: [:index, :new, :create, :destroy]
  get "/my_messages", to: "messages#index", as: :my_messages

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource  :like,     only: [:create, :destroy]
  end

  namespace :admin do
    resources :users, only: [:index, :destroy]
  end
end
