Rails.application.routes.draw do
  resources :imports, only:[:new, :create]
  resources :searches, only: [:create, :show]
  resources :commits, only: :index
  resources :users, only: :update

  root to: "imports#new"
end
