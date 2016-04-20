Rails.application.routes.draw do
  resources :imports, only:[:new, :create]
  resources :commits, only: :index
  resources :users, only: :update

  root to: "imports#new"
end
