Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :recodes, only: [:index, :create]
    resources :favorites, only: [:create, :destroy]
  end
end
